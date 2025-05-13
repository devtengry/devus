import 'package:devus/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:devus/features/auth/presentation/screens/login_screen.dart';
import 'package:devus/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:devus/features/chat/chat_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/reset',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/sign_up_screen',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(path: '/chat', builder: (context, state) => const ChatScreen()),
  ],
);
