import 'package:econmerac_app/core/class/status_request.dart';
import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:econmerac_app/core/functions/handling_data.dart';
import 'package:econmerac_app/core/services/services.dart';
import 'package:econmerac_app/data/datasource/remote/auth/login.dart';
import 'package:econmerac_app/view/screen/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  bool fieldState = true;
  MyServices myServices = Get.put(MyServices());
  void isVisible() {
    fieldState = !fieldState;
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signupScreen);
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
          emailController.text.trim(), passwordController.text.trim());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          myServices.sharedPreferences
              .setString('id', response['data']['users_id'].toString());
          myServices.sharedPreferences
              .setString('email', response['data']['users_email']);
          myServices.sharedPreferences
              .setString('phone', response['data']['users_password']);
          myServices.sharedPreferences
              .setString('username', response['data']['users_name']);
          myServices.sharedPreferences
              .setString('step', '2');
          Get.to(const HomeScreen());
        } else {
          Get.defaultDialog(
              title: 'Warning', middleText: 'Email or Phone Number Not Found.');
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPasswordScreen);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
