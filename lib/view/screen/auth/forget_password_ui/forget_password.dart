import 'package:econmerac_app/controller/auth/forget_password/forget_password_controller.dart';
import 'package:econmerac_app/core/class/status_request.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_button.dart';
import 'package:econmerac_app/view/widget/auth_widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            )),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) =>
              controller.statusRequest == StatusRequest.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Container(
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
                                "Please Enter Your E-mail To Recive \nVrefication Code"
                                    .tr,
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
                    )),
    );
  }
}
