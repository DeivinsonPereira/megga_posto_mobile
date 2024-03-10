// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/Custom_gradient_background.dart';
import '../../controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildAnimation(SplashController controller) {
      return Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 3),
          curve: Curves.ease,
          opacity: controller.animationOpacityLogo.value,
          child: AnimatedContainer(
            width: controller.logoAnimationWidth,
            duration: const Duration(seconds: 3),
            curve: Curves.linearToEaseOut,
            child: SizedBox(
              height: 400,
              child: Image.asset(
                'assets/images/logo_transparente.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      );
    }

    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: CustomGradientBackground(
            child: _buildAnimation(controller),
          ),
        );
      },
    );
  }
}
