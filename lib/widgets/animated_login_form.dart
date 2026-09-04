import 'package:flutter/material.dart';

import 'custom_text_field.dart';
import 'animated_button.dart';

class AnimatedLoginForm extends StatefulWidget {

  final TextEditingController emailController;

  final TextEditingController passwordController;

  final VoidCallback onLogin;

  const AnimatedLoginForm({
    super.key,

    required this.emailController,

    required this.passwordController,

    required this.onLogin,
  });

  @override
  State<AnimatedLoginForm> createState() =>
      _AnimatedLoginFormState();
}

class _AnimatedLoginFormState
    extends State<AnimatedLoginForm>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  late Animation<Offset> slide;

  late Animation<double> opacity;

  bool showPassword = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,

      duration: const Duration(
        milliseconds: 800,
      ),
    );

    slide = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,

        curve: Curves.easeOut,
      ),
    );

    opacity = CurvedAnimation(
      parent: controller,

      curve: Curves.easeOut,
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacity,

      child: SlideTransition(
        position: slide,

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // -------------------------
            // EMAIL
            // -------------------------

            CustomTextField(
              label: 'EMAIL ADDRESS',

              hint: 'name@example.com',

              controller:
                  widget.emailController,

              keyboardType:
                  TextInputType.emailAddress,
            ),

            const SizedBox(
              height: 23,
            ),

            // -------------------------
            // PASSWORD
            // -------------------------

            CustomTextField(
              label: 'PASSWORD',

              hint: '••••••••',

              controller:
                  widget.passwordController,

              obscureText:
                  !showPassword,

              showPassword:
                  showPassword,

              onTogglePassword: () {

                setState(() {
                  showPassword =
                      !showPassword;
                });
              },
            ),

            const SizedBox(
              height: 17,
            ),

            // -------------------------
            // FORGOT PASSWORD
            // -------------------------

            Align(
              alignment:
                  Alignment.centerRight,

              child: GestureDetector(
                onTap: () {},

                child: const Text(
                  'Forgot Password?',

                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF999999),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 22,
            ),

            // -------------------------
            // BOTON
            // -------------------------

            AnimatedButton(
              text: 'Sign In',

              onPressed:
                  widget.onLogin,
            ),
          ],
        ),
      ),
    );
  }
}