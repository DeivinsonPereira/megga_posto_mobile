// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:megga_posto_mobile/common/Custom_gradient_background.dart';
import 'package:megga_posto_mobile/common/custom_elevated_button.dart';
import 'package:megga_posto_mobile/common/custom_image.dart';
import 'package:megga_posto_mobile/common/custom_text_assignature.dart';
import 'package:megga_posto_mobile/common/custom_text_field.dart';
import 'package:megga_posto_mobile/common/static/custom_colors.dart';
import 'package:megga_posto_mobile/common/static/custom_text_style.dart';
import 'package:megga_posto_mobile/page/config/config_page.dart';
import 'package:megga_posto_mobile/service/dependencies.dart';

import '../../common/custom_container_transparent.dart';
import '../../common/custom_title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var loginController = Dependencies.loginController();

    // Constrói o botão de configuração
    Widget _buildButtonConfig() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: () => Get.to(() => const ConfigPage()),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(5),
                child: const Icon(
                  Icons.settings,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }

    // Constrói os campo de texto
    Widget _buildTextField(
        String text, IconData icon, TextEditingController controller,
        {bool? isSecret = false}) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.secondaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(17.0),
        ),
        child: CustomTextField(
          text: text,
          controller: controller,
          icon: icon,
          radious: 15,
          filledColor: Colors.white,
          isFilled: true,
        ),
      );
    }

    // Constrói os botões de "ENTRAR" e "VIA RFID"
    Widget _buildElevatedButton(
        String text, Function() function, Color colorButton) {
      return SizedBox(
        width: double.infinity,
        height: 60,
        child: CustomElevatedButton(
            text: text,
            textStyle: CustomTextStyles.buttonLoginStyle,
            function: function,
            radious: 15,
            colorButton: colorButton),
      );
    }

    // Constrói a assinatura do aplicativo
    Widget _textAssignation() {
      return const Align(
          alignment: Alignment.bottomCenter, child: CustomTextAssignature());
    }

    // Constrói o conteúdo do container
    Widget _buildContainerBody() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            const CustomTitle(text: 'Login'),
            const SizedBox(
              height: 10,
            ),
            _buildTextField(
              'Usuário',
              Icons.person,
              loginController.usuarioController,
            ),
            const SizedBox(
              height: 10,
            ),
            _buildTextField(
                'Senha', Icons.lock, loginController.senhaController,
                isSecret: true),
            const SizedBox(
              height: 10,
            ),
            _buildElevatedButton(
                'ENTRAR', () => null, CustomColors.elevatedButtonPrimary),
            const SizedBox(
              height: 10,
            ),
            _buildElevatedButton(
                'VIA RFID', () => null, CustomColors.elevatedButtonSecondary),
            Expanded(child: _textAssignation()),
          ],
        ),
      );
    }

    // Constrói o container transparente
    Widget _buildContainer() {
      return CustomContainerTransparent(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildContainerBody(),
          ),
        ),
      );
    }

    // Constrói o corpo da page
    Widget _buildBody() {
      return Column(
        children: [
          _buildButtonConfig(),
          CustomImage.customLogoTransparent(2.5),
          const SizedBox(height: 50),
          SizedBox(
            height: Get.size.height * 0.643,
            width: Get.size.width,
            child: _buildContainer(),
          ),
        ],
      );
    }

    // Constrói a page
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomGradientBackground(
          child: SafeArea(child: _buildBody()),
        ),
      ),
    );
  }
}
