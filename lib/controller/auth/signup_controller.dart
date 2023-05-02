import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController usernameController;

  bool fieldState = true;
  void isVisible() {
    fieldState = !fieldState;
    update();
  }
  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.loginScreen );
  }

  @override
  signUp() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.offNamed(AppRoutes.vrifyCodeSignUpScreen);
      //Get.delete<SignUpControllerImp>();
      print('Valid');
    } else {
      print('Not Vlaid');
    }
    
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    usernameController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    super.dispose();
  }
}
