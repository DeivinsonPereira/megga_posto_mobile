import 'package:get/get.dart';
import 'package:megga_posto_mobile/controller/config_controller.dart';
import 'package:megga_posto_mobile/controller/text_field_controller.dart';

import '../controller/login_controller.dart';
import '../controller/splash_controller.dart';

abstract class Dependencies {

  static SplashController splashController() {
    if( Get.isRegistered<SplashController>() ) {
      return Get.find<SplashController>();
    }else {
      return Get.put( SplashController() );
    }
  }

  static LoginController loginController() {
    if( Get.isRegistered<LoginController>() ) {
      return Get.find<LoginController>();
    } else {
      return Get.put( LoginController() );
    }
  }

  static TextFieldController textFieldController(){
    if( Get.isRegistered<TextFieldController>() ) {
      return Get.find<TextFieldController>();
    } else {
      return Get.put( TextFieldController() );
    }
  }

  static ConfigController configController(){
    if( Get.isRegistered<ConfigController>() ) {
      return Get.find<ConfigController>();
    } else {
      return Get.put( ConfigController() );
    }
  }
}