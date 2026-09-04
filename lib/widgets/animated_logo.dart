import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() =>
      _AnimatedLogoState();
}

class _AnimatedLogoState
    extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  late Animation<double> opacity;

  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,

      duration: const Duration(
        milliseconds: 900,
      ),
    );

    opacity = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    scale = Tween<double>(
      begin: 0.75,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      ),
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

      child: ScaleTransition(
        scale: scale,

        child: Image.asset(
          'assets/images/logo_ap.png',

          width: 90,
          height: 90,

          fit: BoxFit.contain,
        ),
      ),
    );
  }
}