import 'package:econmerac_app/core/class/status_request.dart';
import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:econmerac_app/core/functions/handling_data.dart';
import 'package:econmerac_app/data/datasource/remote/auth/signup.dart';
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
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  bool fieldState = true;
  void isVisible() {
    fieldState = !fieldState;
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.loginScreen);
  }

  SignUpData signupData = SignUpData(Get.find());

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          usernameController.text.trim(),
          passwordController.text.trim(),
          emailController.text.trim(),
          phoneController.text.trim());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.vrifyCodeSignUpScreen  ,arguments: {'email': emailController.text.trim()});
        } else {
          Get.defaultDialog(
              title: 'Warning',
              middleText: 'Email or Phone Number is Already Exist.');
          statusRequest = StatusRequest.failure;
        }
      }
      update();
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
