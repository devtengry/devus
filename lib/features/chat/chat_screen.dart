import 'dart:io'; // Dosya işlemleri için (resim okuma)

import 'package:dash_chat_2/dash_chat_2.dart'; // Hazır sohbet arayüzü için
import 'package:devus/common/widgets/text_widget_custom.dart'; // Özel metin widget'ı
import 'package:flutter/material.dart'; // Temel Flutter widget'ları
import 'package:flutter/services.dart'; // Platforma özgü servislerle iletişim için (kullanılmıyor gibi)
import 'package:flutter_gemini/flutter_gemini.dart'; // Gemini API ile iletişim için
import 'package:go_router/go_router.dart'; // Sayfalar arası yönlendirme için
import 'package:image_picker/image_picker.dart'; // Galeriden veya kameradan resim seçmek için

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState(); // Bu widget için state nesnesini oluşturur
}

// ChatScreen widget'ının durumunu yöneten state sınıfı
class _ChatScreenState extends State<ChatScreen> {
  final Gemini gemini = Gemini.instance; // Gemini API istemcisinin bir örneği
  List<ChatMessage> messages = []; // Sohbet mesajlarını tutan liste
  ChatUser currentUser = ChatUser(
    id: "0",
    firstName: 'User 1',
  ); // Sohbeti kullanan geçerli kullanıcı.
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
  ); // Gemini botunu temsil eden kullanıcı.

  @override
  Widget build(BuildContext context) {
    // Widget'ın kullanıcı arayüzünü oluşturur
    return Scaffold(
      appBar: AppBar(
        title: TextWidgetCustom(
          customText: 'DevUs Chat',
        ), // Özel başlık widget'ı
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed:
              () =>
                  context.go('/'), // Geri butonuna basıldığında ana sayfaya git
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
      ),
      body: SafeArea(
        child: _buildUI(),
      ), // Ekranın güvenli alanında sohbet arayüzünü oluşturur
    );
  }

  // Sohbet arayüzünü oluşturan özel widget
  Widget _buildUI() {
    return DashChat(
      inputOptions: InputOptions(
        inputDecoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        trailing: [
          IconButton(
            onPressed: _sendMediaMessage,
            icon: Icon(Icons.image),
          ), // Resim gönderme butonu
        ],
      ),
      currentUser: currentUser, // Geçerli kullanıcıyı DashChat'e bildirir
      onSend:
          _sendMessage, // Kullanıcı mesaj gönderdiğinde çağrılacak fonksiyon
      messages: messages, // Sohbet mesajlarını DashChat'e iletir
    );
  }

  // Kullanıcının gönderdiği mesajı işleyen fonksiyon
  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [
        chatMessage,
        ...messages,
      ]; // Yeni mesajı mesaj listesinin başına ekleyerek arayüzü günceller
    });
    try {
      String question = chatMessage.text; // Gönderilen mesajın metin içeriği
      List<Uint8List>?
      images; // Eğer varsa, gönderilen resmin bayt verisini tutacak liste
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ]; // Gönderilen ilk medyanın dosyasını okuyarak bayt verisini alır
      }
      // Gemini API'sine sorguyu ve varsa görselleri gönderen stream'i dinler
      gemini.streamGenerateContent(question, images: images).listen((event) {
        ChatMessage? lastMessage =
            messages.firstOrNull; // En son gönderilen mesajı alır
        if (lastMessage != null && lastMessage.user == geminiUser) {
          // Eğer en son mesaj Gemini'ye aitse, bu gelen event önceki yanıtın devamıdır
          final newResponsePart =
              event.content?.parts?.fold<String>(
                "",
                (previous, current) =>
                    previous +
                    (current is TextPart
                        ? current.text
                        : ""), // Sadece TextPart'ların metin içeriğini alır
              ) ??
              "";
          final updatedMessage = ChatMessage(
            user: lastMessage.user,
            createdAt: lastMessage.createdAt,
            text:
                lastMessage.text +
                newResponsePart, // Önceki mesaja yeni yanıt parçasını ekler
          );
          setState(() {
            messages[messages.indexOf(lastMessage)] =
                updatedMessage; // Güncellenmiş mesajı listedeki eski mesajın yerine koyar
          });
        } else {
          // Eğer en son mesaj kullanıcıya aitse, bu gelen event yeni bir Gemini yanıtıdır
          final response =
              event.content?.parts?.fold<String>(
                "",
                (previous, current) =>
                    previous +
                    (current is TextPart
                        ? current.text
                        : ""), // Sadece TextPart'ların metin içeriğini alır
              ) ??
              "";
          final message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text:
                response, // Gemini'den gelen yanıtı içeren yeni bir mesaj oluşturur
          );
          setState(() {
            messages = [
              message,
              ...messages,
            ]; // Yeni Gemini mesajını listenin başına ekleyerek arayüzü günceller
          });
        }
      });
    } catch (e) {
      // Hata durumunda hatayı konsola yazdırır
      // ignore: avoid_print
      print(e);
    }
  }

  // Kullanıcının medya (şu anda sadece resim) göndermesini sağlayan fonksiyon
  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker(); // ImagePicker nesnesi oluşturur
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    ); // Galeriden resim seçmeyi bekler
    if (file != null) {
      // Eğer bir resim seçildiyse yeni bir mesaj oluşturur
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text:
            'Describe this image', // Resimle birlikte gönderilecek varsayılan metin
        medias: [
          ChatMedia(
            url: file.path,
            fileName: '',
            type: MediaType.image,
          ), // Seçilen resmin medya bilgisini oluşturur
        ],
      );
      _sendMessage(
        chatMessage,
      ); // Oluşturulan medya mesajını göndermek için _sendMessage fonksiyonunu çağırır
    }
  }
}

class ClassName {}
