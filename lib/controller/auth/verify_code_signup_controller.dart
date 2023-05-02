import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkEmail();
  goToSuccesSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String verfiyCode;
  @override
  goToSuccesSignUp() {
    Get.offNamed(AppRoutes.successSignUpScreen);
  }

  @override
  checkEmail() {}

  @override
  void onInit() {
    super.onInit();
  }
}
