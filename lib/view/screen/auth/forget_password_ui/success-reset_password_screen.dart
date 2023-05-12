import 'package:econmerac_app/controller/auth/forget_password/success_reset_password_controller.dart';
import 'package:econmerac_app/core/class/handling_data_request.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPasswordScreen extends StatelessWidget {
  const SuccessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      body: GetBuilder<SuccessResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequset: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(20),
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Icon(
                      Icons.check_circle_outline,
                      color: primaryColor,
                      size: 150,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Your Password Reseted Successfuly\n Now You Can Login With\n New Passsword",
                      textAlign: TextAlign.center,
                      style: authStyle.copyWith(fontSize: 15, color: grey),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    CustomAuthButton(
                        title: 'Log In'.tr,
                        press: () {
                          controller.goToLogin();
                        })
                  ],
                ),
              ))),
    );
  }
}
