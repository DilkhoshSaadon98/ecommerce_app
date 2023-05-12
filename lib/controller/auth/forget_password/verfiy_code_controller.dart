import 'package:econmerac_app/core/class/status_request.dart';
import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:econmerac_app/core/functions/handling_data.dart';
import 'package:econmerac_app/data/datasource/remote/auth/forget_password/verify_code_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerfiyCodeController extends GetxController {
  checkEmail();
  goToResetPassword(String verifyCode);
}

class VerfiyCodeControllerImp extends VerfiyCodeController {
  String? email;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
    StatusRequest statusRequest = StatusRequest.none;
  @override
  goToResetPassword(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postData(email!, verifyCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.resetPasswordScreen,arguments: {
          'email':email
        });
      } else {
        Get.defaultDialog(
            title: 'Warning', middleText: 'Verify Code is Not Valid.');
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  checkEmail() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
