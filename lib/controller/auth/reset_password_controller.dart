import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  checkCode();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  goToSuccessResetPassword() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      print(' Valid');
      Get.offNamed(AppRoutes.successResetPasswordScreen);
    } else {
      print('Not Vlaid');
    }
  }

  @override
  checkCode() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  @override
  void onInit() {
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    rePasswordController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
