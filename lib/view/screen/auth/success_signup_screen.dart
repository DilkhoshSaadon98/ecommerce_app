import 'package:econmerac_app/controller/auth/success_signin_controller.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignInControllerImp controller =
        Get.put(SuccessSignInControllerImp());
    return Scaffold(
      body: Container(
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
              "Account Created Succefully Now You Can Log In...",
              textAlign: TextAlign.center,
              style: authStyle.copyWith(fontSize: 15, color: grey),
            ),
            Spacer(
              flex: 1,
            ),
            CustomAuthButton(
                title: 'Log In'.tr,
                press: () {
                  controller.goToSignUpVerifyCode();
                })
          ],
        ),
      ),
    );
  }
}
