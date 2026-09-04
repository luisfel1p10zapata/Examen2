import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/auth_service.dart';
import '../widgets/animated_logo.dart';
import '../widgets/animated_login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    AuthService.login();

    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Center(
                    child: Container(
                      width: 354,
                      padding: const EdgeInsets.fromLTRB(25, 28, 25, 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),

                      child: Column(
                        children: [
                          const AnimatedLogo(),

                          const SizedBox(height: 18),

                          const Text(
                            'Welcome Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF202124),
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            'Sign in to your private account',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),

                          const SizedBox(height: 50),

                          AnimatedLoginForm(
                            emailController: emailController,
                            passwordController: passwordController,
                            onLogin: login,
                          ),
                          const SizedBox(height: 18),

                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                              children: [
                                TextSpan(text: "Don't have an account? "),
                                TextSpan(
                                  text: 'Create one',
                                  style: TextStyle(
                                    color: Color(0xFFED145B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 18),

                          const Spacer(),

                          const SizedBox(height: 10),

                          const Text(
                            'DISCRETE BILLING & SECURE CONNECTION GUARANTEED',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 7,
                              color: Colors.grey,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
