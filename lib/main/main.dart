import 'package:devus/firebase_options.dart';
import 'package:devus/main/main_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Gemini.init(apiKey: dotenv.env['GEMINI_API'] ?? '');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();

  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      child: EasyLocalization(
        path: 'assets/l10n',
        supportedLocales: [Locale('en', 'US')],
        fallbackLocale: Locale('en', 'US'),
        child: MainApp(),
      ),
    ),
  );
}
