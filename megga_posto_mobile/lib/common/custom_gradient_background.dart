// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'static/custom_colors.dart';

class CustomGradientBackground extends StatelessWidget {
  final Widget child;
  const CustomGradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [CustomColors.primaryColor, CustomColors.secondaryColor],
        ),
      ),
      child: child,
    );
  }
}
