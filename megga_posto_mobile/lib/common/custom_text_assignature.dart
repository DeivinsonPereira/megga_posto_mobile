import 'package:flutter/material.dart';

class CustomTextAssignature extends StatelessWidget {
  const CustomTextAssignature({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'App desenvolvido por: ',
        style: TextStyle(color: Colors.white),
      ),
      Text(
        'Megabyte Sistemas',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
      )
    ]);
  }
}
