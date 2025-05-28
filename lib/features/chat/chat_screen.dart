import 'dart:io';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:devus/common/widgets/text_widget_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatService _chatService = ChatService();
  List<ChatMessage> messages = [];
  final ChatUser currentUser = ChatUser(id: "0", firstName: 'User 1');
  final ChatUser geminiUser = ChatUser(id: "1", firstName: "DevUs");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidgetCustom(customText: 'DevUs Chat'),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

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
          IconButton(onPressed: _sendMediaMessage, icon: Icon(Icons.image)),
        ],
      ),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    _chatService.sendMessage(
      chatMessage: chatMessage,
      geminiUser: geminiUser,
      messages: messages,
      onUpdate: (updatedMessages) {
        setState(() {
          messages = updatedMessages;
        });
      },
    );
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: 'Describe this image',
        medias: [
          ChatMedia(url: file.path, fileName: '', type: MediaType.image),
        ],
      );
      _sendMessage(chatMessage);
    }
  }
}

class ChatService {
  final Gemini gemini = Gemini.instance;

  void sendMessage({
    required ChatMessage chatMessage,
    required ChatUser geminiUser,
    required List<ChatMessage> messages,
    required Function(List<ChatMessage>) onUpdate,
  }) {
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [File(chatMessage.medias!.first.url).readAsBytesSync()];
      }
      gemini.streamGenerateContent(question, images: images).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          final newResponsePart =
              event.content?.parts?.fold<String>(
                "",
                (previous, current) =>
                    previous + (current is TextPart ? current.text : ""),
              ) ??
              "";
          final updatedMessage = ChatMessage(
            user: lastMessage.user,
            createdAt: lastMessage.createdAt,
            text: lastMessage.text + newResponsePart,
          );
          final updatedMessages = List<ChatMessage>.from(messages);
          updatedMessages[updatedMessages.indexOf(lastMessage)] =
              updatedMessage;
          onUpdate(updatedMessages);
        } else {
          final response =
              event.content?.parts?.fold<String>(
                "",
                (previous, current) =>
                    previous + (current is TextPart ? current.text : ""),
              ) ??
              "";
          final message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          onUpdate([message, ...messages]);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
