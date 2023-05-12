import 'package:econmerac_app/controller/auth/login_controller.dart';
import 'package:econmerac_app/core/class/handling_data_request.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:econmerac_app/core/constant/image_link.dart';
import 'package:econmerac_app/core/functions/alert_exit_app.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_button.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_textfield.dart';
import 'package:econmerac_app/view/widget/auth_widget/footer_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: white,
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
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
                        LottieBuilder.asset(
                          AppImageAssets.logo,
                          animate: true,
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Welcome Back".tr,
                          textAlign: TextAlign.center,
                          style: authStyle.copyWith(
                              fontWeight: FontWeight.w100, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Log In with your Email and Password \n or Continue with Social Media"
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
                            title: 'E-mail',
                            controller: controller.emailController,
                            icon: Icons.email_outlined),
                        CustomTextFieldAuth(
                            title: 'Password',
                            controller: controller.passwordController,
                            icon: Icons.password_outlined),
                        GestureDetector(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text("Forget Password",
                              textAlign: TextAlign.end,
                              style: authStyle.copyWith(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: grey)),
                        ),
                        CustomAuthButton(
                          press: () {
                            controller.login();
                          },
                          title: 'Log In'.tr,
                        ),
                        FooterText(
                          press: () {
                            controller.goToSignUp();
                          },
                          buttonTitle: 'Sign Up'.tr,
                          title: 'Don\'t Have an Account? '.tr,
                        )
                      ],
                    ),
                  ),
                ))),
      ),
    );
  }
}
