import 'package:econmerac_app/controller/auth/signup_controller.dart';
import 'package:econmerac_app/core/class/handling_data_request.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:econmerac_app/core/functions/alert_exit_app.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_button.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_textfield.dart';
import 'package:econmerac_app/view/widget/auth_widget/footer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: white,
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequset: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Sign Up".tr,
                          textAlign: TextAlign.center,
                          style: authStyle.copyWith(
                              fontWeight: FontWeight.w100, fontSize: 30),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Sign Up with your Email and Password \n or Continue with Social Media"
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
                            title: 'Username',
                            controller: controller.usernameController,
                            icon: Icons.person_outline),
                        CustomTextFieldAuth(
                            title: 'E-mail',
                            controller: controller.emailController,
                            icon: Icons.email_outlined),
                        CustomTextFieldAuth(
                          title: 'Phone',
                          isPhone: true,
                          controller: controller.phoneController,
                          icon: Icons.phone_outlined,
                        ),
                        CustomTextFieldAuth(
                            title: 'Password',
                            controller: controller.passwordController,
                            icon: Icons.password_outlined),
                        CustomAuthButton(
                          press: () {
                            controller.signUp();
                          },
                          title: 'Sign In'.tr,
                        ),
                        FooterText(
                          press: () {
                            controller.goToSignIn();
                          },
                          buttonTitle: 'Sign In'.tr,
                          title: 'Already Have an Account? '.tr,
                        )
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
