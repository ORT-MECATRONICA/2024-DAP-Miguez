import 'package:';
import 'package:logueo_paginas/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
  GoRoute(
    path: '/login',
    builder: ((context, state) => const LoginScreen())
  ),
  GoRoute(
    path: '/home/:user',
    builder: (context, state) {
        final user = state.pathParameters['user'] as String; 
        return HomeScreen(user: user);
      }
    )
]);