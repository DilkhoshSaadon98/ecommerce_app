import 'package:econmerac_app/controller/auth/forget_password_controller.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_button.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
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
                height: 100,
              ),
              Text(
                "Check E-mail".tr,
                textAlign: TextAlign.center,
                style: authStyle.copyWith(
                    fontWeight: FontWeight.w100, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please Enter Tour E-mail To Recive \nVrefication Code".tr,
                textAlign: TextAlign.center,
                style: authStyle.copyWith(
                    height: 1.5,
                    fontWeight: FontWeight.w200,
                    fontSize: 13,
                    color: grey),
              ),
              const SizedBox(
                height: 100,
              ),
              CustomTextFieldAuth(
                  title: 'E-mail',
                  controller: controller.emailController,
                  icon: Icons.email_outlined),
              CustomAuthButton(
                press: () {
                  controller.goToVerfiyCode();
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
