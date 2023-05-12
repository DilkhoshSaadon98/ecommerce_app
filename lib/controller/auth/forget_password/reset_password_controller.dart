import 'package:econmerac_app/core/class/status_request.dart';
import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:econmerac_app/core/functions/handling_data.dart';
import 'package:econmerac_app/data/datasource/remote/auth/forget_password/reset_password.dart';
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
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  @override
  goToSuccessResetPassword() async {
    var formData = formState.currentState;
    if(passwordController == rePasswordController){
      Get.defaultDialog(
              title: 'Warning', middleText: 'Please Type Same Password');
          statusRequest = StatusRequest.failure;
    }
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(
          email!, passwordController.text.trim());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.successResetPasswordScreen);
        } else {
          Get.defaultDialog(
              title: 'Warning', middleText: 'Please Try Again');
          statusRequest = StatusRequest.failure;
        }
      }
      update();
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
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    rePasswordController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
