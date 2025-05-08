import 'package:devus/firebase_options.dart';
import 'package:devus/main/main_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  WidgetsFlutterBinding.ensureInitialized();
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
