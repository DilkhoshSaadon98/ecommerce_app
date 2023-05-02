import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool fieldState = true;
  void isVisible() {
    fieldState = !fieldState;
    update();
  }
  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signupScreen);
  }

  @override
  login() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.delete<LoginControllerImp>();
      print(' Valid');
    } else {
      print('Not Vlaid');
    }
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPasswordScreen);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
