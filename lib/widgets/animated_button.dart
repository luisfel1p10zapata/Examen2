import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {

  final String text;

  final VoidCallback onPressed;

  const AnimatedButton({
    super.key,

    required this.text,

    required this.onPressed,
  });

  @override
  State<AnimatedButton> createState() =>
      _AnimatedButtonState();
}

class _AnimatedButtonState
    extends State<AnimatedButton> {

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      // -------------------------
      // PRESIONADO
      // -------------------------

      onTapDown: (_) {

        setState(() {
          pressed = true;
        });
      },

      // -------------------------
      // SOLTAR
      // -------------------------

      onTapUp: (_) {

        setState(() {
          pressed = false;
        });

        widget.onPressed();
      },

      // -------------------------
      // CANCELAR
      // -------------------------

      onTapCancel: () {

        setState(() {
          pressed = false;
        });
      },

      child: AnimatedScale(
        scale: pressed ? 0.96 : 1.0,

        duration:
            const Duration(
          milliseconds: 100,
        ),

        child: Container(
          width: double.infinity,

          height: 51,

          decoration: BoxDecoration(
            color:
                const Color(0xFFE91E63),

            borderRadius:
                BorderRadius.circular(7),

            boxShadow: const [
              BoxShadow(
                color:
                    Color(0x35E91E63),

                blurRadius: 13,

                offset:
                    Offset(0, 7),
              ),
            ],
          ),

          child: Center(
            child: Text(
              widget.text,

              style: const TextStyle(
                color: Colors.white,

                fontSize: 14,

                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}