import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // No permite volver al Login
      canPop: false,

      child: Scaffold(
        // -------------------------
        // APP BAR
        // -------------------------
        appBar: AppBar(
          title: const Text('Home'),

          centerTitle: true,

          automaticallyImplyLeading: false,

          actions: [
            IconButton(
              onPressed: () {
                // Solo si quieren agregar
                // cerrar sesión después.

                AuthService.logout();

                context.go('/login');
              },

              icon: const Icon(Icons.logout),
            ),
          ],
        ),

        // -------------------------
        // CONTENIDO
        // -------------------------
        body: const Center(
          child: Text(
            'Bienvenido al Home',

            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
