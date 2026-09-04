import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String label;

  final String hint;

  final TextEditingController controller;

  final bool obscureText;

  final TextInputType keyboardType;

  final VoidCallback? onTogglePassword;

  final bool showPassword;

  const CustomTextField({
    super.key,

    required this.label,

    required this.hint,

    required this.controller,

    this.obscureText = false,

    this.keyboardType =
        TextInputType.text,

    this.onTogglePassword,

    this.showPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        // -------------------------
        // LABEL
        // -------------------------

        Text(
          label,

          style: const TextStyle(
            fontSize: 11,

            fontWeight:
                FontWeight.w500,

            letterSpacing: 1.2,

            color: Color(0xFF9A9A9A),
          ),
        ),

        const SizedBox(
          height: 8,
        ),

        // -------------------------
        // INPUT
        // -------------------------

        TextField(
          controller: controller,

          obscureText: obscureText,

          keyboardType: keyboardType,

          style: const TextStyle(
            fontSize: 14,

            color: Color(0xFF333333),
          ),

          decoration: InputDecoration(

            hintText: hint,

            hintStyle: const TextStyle(
              color: Color(0xFFC8C8C8),

              fontSize: 14,
            ),

            filled: true,

            fillColor:
                const Color(0xFFF8F9FA),

            contentPadding:
                const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15,
            ),

            border:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(7),

              borderSide:
                  BorderSide.none,
            ),

            enabledBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(7),

              borderSide:
                  BorderSide.none,
            ),

            focusedBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(7),

              borderSide:
                  const BorderSide(
                color: Color(0xFFE91E63),

                width: 1,
              ),
            ),

            // -------------------------
            // ICONO PASSWORD
            // -------------------------

            suffixIcon:
                onTogglePassword != null
                    ? IconButton(
                        onPressed:
                            onTogglePassword,

                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,

                          size: 19,

                          color: Colors.grey,
                        ),
                      )
                    : null,
          ),
        ),
      ],
    );
  }
}