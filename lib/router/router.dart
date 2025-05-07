import 'package:devus/features/auth/presentation/screens/login_screen.dart';
import 'package:devus/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const SignInScreen(),
    ),

    // Diğer sayfaları buraya ekleyebilirsin
  ],
);
