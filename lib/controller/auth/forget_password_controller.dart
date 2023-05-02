import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  signUp();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController emailController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  goToVerfiyCode() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      print(' Valid');
      Get.offNamed(AppRoutes.vrifyCodeScreen);
    } else {
      print('Not Vlaid');
    }
  }

  @override
  signUp() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
