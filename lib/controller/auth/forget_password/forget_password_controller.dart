import 'package:econmerac_app/core/class/status_request.dart';
import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:econmerac_app/core/functions/handling_data.dart';
import 'package:econmerac_app/data/datasource/remote/auth/forget_password/check_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  signUp();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController emailController;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  @override
  goToVerfiyCode() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(
        emailController.text.trim(),
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.toNamed(AppRoutes.vrifyCodeScreen,
              arguments: {"email": emailController.text.trim()});
        } else {
          Get.defaultDialog(title: 'Warning', middleText: 'Email Not Exist.');
          statusRequest = StatusRequest.failure;
        }
      }
      update();
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
