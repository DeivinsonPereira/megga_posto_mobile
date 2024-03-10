// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/controller/text_field_controller.dart';

import '../service/dependencies.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final IconData icon;
  final double radious;
  bool? isFilled;
  Color? filledColor;
  bool? isSecret;

  CustomTextField({
    Key? key,
    required this.text,
    required this.controller,
    required this.icon,
    required this.radious,
    this.isFilled = false,
    this.filledColor = Colors.transparent,
    this.isSecret = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dependencies.textFieldController();

    return GetBuilder<TextFieldController>(builder: (textFieldController) {
      return TextFormField(
        obscureText:
            isSecret! == false ? false : textFieldController.isObscure.value,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radious),
            ),
          ),
          isDense: true,
          filled: isFilled!,
          fillColor: filledColor,
          suffixIcon: isSecret == false
              ? null
              : IconButton(
                  onPressed: () => textFieldController.toggleObscure(),
                  icon: Obx(() => Icon(
                        size: 25,
                        textFieldController.isObscure.value == false
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                      )),
                ),
          hintText: text,
          prefixIcon: Icon(
            icon,
            size: 25,
          ),
        ),
      );
    });
  }
}
