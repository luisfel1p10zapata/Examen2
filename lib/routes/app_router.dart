import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../services/auth_service.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',

  redirect: (context, state) {
    final bool loggedIn = AuthService.isLoggedIn;

    final String location = state.matchedLocation;

    // Si intenta entrar al Home sin pasar por el Login
    if (location == '/home' && !loggedIn) {
      return '/login';
    }

    // Si ya pasó por Login e intenta volver a Login
    if (location == '/login' && loggedIn) {
      return '/home';
    }

    return null;
  },

  routes: [
    // -------------------------
    // LOGIN
    // -------------------------
    GoRoute(
      path: '/login',

      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,

          child: const LoginScreen(),

          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),

    // -------------------------
    // HOME
    // -------------------------
    GoRoute(
      path: '/home',

      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,

          child: const HomeScreen(),

          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Movimiento desde la derecha
            final slideAnimation =
                Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                );

            return SlideTransition(
              position: slideAnimation,

              child: FadeTransition(opacity: animation, child: child),
            );
          },
        );
      },
    ),
  ],
);
