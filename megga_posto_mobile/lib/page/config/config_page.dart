// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/Custom_gradient_background.dart';
import 'package:megga_posto_mobile/common/custom_arrow_back_icon.dart';
import 'package:megga_posto_mobile/common/custom_container_transparent.dart';
import 'package:megga_posto_mobile/common/custom_elevated_button.dart';
import 'package:megga_posto_mobile/common/custom_text_assignature.dart';
import 'package:megga_posto_mobile/common/custom_text_field.dart';
import 'package:megga_posto_mobile/common/static/custom_colors.dart';
import 'package:megga_posto_mobile/controller/config_controller.dart';
import 'package:megga_posto_mobile/service/dependencies.dart';

import '../../common/custom_image.dart';
import '../../common/custom_title.dart';
import '../../common/static/custom_text_style.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    var configController = Dependencies.configController();

    // Constrói o botão de voltar
    Widget _buildArrowBack() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomArrowBackButton(
            function: () => Get.back(),
          ),
        ],
      );
    }

    Widget _buildConfirmButton() {
      return SizedBox(
        height: 60,
        width: double.infinity,
        child: CustomElevatedButton(
            text: 'CONFIRMAR',
            textStyle: CustomTextStyles.buttonLoginStyle,
            function: () {},
            radious: 15,
            colorButton: CustomColors.elevatedButtonSecondary),
      );
    }

    Widget _buildTextField() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.secondaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(17.0),
        ),
        child: CustomTextField(
          text: 'Digite o ip do servidor',
          controller: configController.ipServidorController,
          icon: Icons.wifi,
          radious: 15,
          isFilled: true,
          filledColor: Colors.white,
        ),
      );
    }

    Widget _buildAssignature() {
      return const Align(
          alignment: Alignment.bottomCenter, child: CustomTextAssignature());
    }

    // Constrói o conteúdo de dentro do container transparente
    Widget _buildContainerBody() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: CustomTitle(text: 'Configurações'),
            ),
            const SizedBox(height: 50),
            _buildTextField(),
            const SizedBox(height: 25),
            _buildConfirmButton(),
            Expanded(child: _buildAssignature()),
          ],
        ),
      );
    }

    Widget _buildBody() {
      return Column(
        children: [
          _buildArrowBack(),
          CustomImage.customLogoTransparent(2.5),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: CustomContainerTransparent(
              child: _buildContainerBody(),
            ),
          ),
        ],
      );
    }

    return Scaffold(
        body: CustomGradientBackground(child: SafeArea(child: _buildBody())));
  }
}
