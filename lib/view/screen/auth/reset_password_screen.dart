import 'package:econmerac_app/controller/auth/reset_password_controller.dart';
import 'package:econmerac_app/controller/auth/verfiy_code_controller.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_button.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: controller.formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "New Password".tr,
                textAlign: TextAlign.center,
                style:
                    authStyle.copyWith(fontWeight: FontWeight.w100, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please Enter a New Password then ReType Your Password To Confirm it"
                    .tr,
                textAlign: TextAlign.center,
                style: authStyle.copyWith(
                    height: 1.5,
                    fontWeight: FontWeight.w200,
                    fontSize: 13,
                    color: grey),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFieldAuth(
                  title: 'New Password',
                  controller: controller.passwordController,
                  icon: Icons.email_outlined),
              CustomTextFieldAuth(
                  title: 'Confirm Password',
                  controller: controller.rePasswordController,
                  icon: Icons.email_outlined),
              CustomAuthButton(
                press: () {
                  controller.goToSuccessResetPassword();
                },
                title: 'Check'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
