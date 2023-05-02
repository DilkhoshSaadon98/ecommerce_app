import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerfiyCodeController extends GetxController {
  checkEmail();
  goToResetPassword();
}

class VerfiyCodeControllerImp extends VerfiyCodeController {
  late String verfiyCode;
  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetPasswordScreen);
  }

  @override
  checkEmail() {}

  @override
  void onInit() {
    super.onInit();
  }
}
