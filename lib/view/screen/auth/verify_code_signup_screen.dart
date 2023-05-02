import 'package:econmerac_app/controller/auth/verfiy_code_controller.dart';
import 'package:econmerac_app/controller/auth/verify_code_signup_controller.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUpScreen extends StatelessWidget {
  const VerifyCodeSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller =
        Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: const EdgeInsets.all(15),
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
              "Verfiy Code".tr,
              textAlign: TextAlign.center,
              style:
                  authStyle.copyWith(fontWeight: FontWeight.w100, fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Please Enter The Code Digit Send To \ntest@gmail.com".tr,
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
            OtpTextField(
              fieldWidth: 50,
              borderRadius: BorderRadius.circular(15),
              numberOfFields: 5,
              showFieldAsBox: true,
              autoFocus: true,
              keyboardType: TextInputType.number,
              enabledBorderColor: primaryColor,
              borderColor: primaryColor,
              onCodeChanged: (value) {},
              onSubmit: (value) {
                controller.goToSuccesSignUp();
              },
            ),
          ],
        ),
      ),
    );
  }
}
