import 'dart:math';

import 'package:econmerac_app/core/class/status_request.dart';
import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:econmerac_app/core/functions/handling_data.dart';
import 'package:econmerac_app/data/datasource/remote/auth/verify_code_signup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkEmail();
  goToSuccesSignUp(String verificationCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUp verifyCodeSignUp = VerifyCodeSignUp(Get.find());
  String? email;
    StatusRequest statusRequest = StatusRequest.none;
  @override
  goToSuccesSignUp(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUp.postData(email!, verificationCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoutes.successSignUpScreen);
      } else {
        Get.defaultDialog(
            title: 'Warning',
            middleText: 'Verify Code is Not Valid.');
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
