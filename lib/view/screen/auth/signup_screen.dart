import 'package:ecommercecourse/controller/auth/signup_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/functions/alert_exit_app.dart';
import 'package:ecommercecourse/core/functions/validinput.dart';
import 'package:ecommercecourse/view/screen/auth/components/custom_texttitle_auth.dart';
import 'package:ecommercecourse/view/screen/auth/components/logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/custom_button_auth.dart';
import 'components/custom_textform_auth.dart';
import 'components/text_signup.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const SizedBox(height: 20),
                      const LogoAuth(
                        title: AppImageAsset.registration,
                      ),
                      CustomTextTitleAuth(text: "Sign Up".tr),
                      const SizedBox(height: 35),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 20, "username");
                        },
                        mycontroller: controller.username,
                        hinttext: "23".tr,
                        iconData: Icons.person_outline,
                        labeltext: "20".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: false,

                        valid: (val) {
                          return validInput(val!, 3, 40, "email");
                        },
                        mycontroller: controller.email,
                        hinttext: "12".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "18".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        isNumber: true,
                        valid: (val) {
                          return validInput(val!, 7, 11, "phone");
                        },
                        mycontroller: controller.phone,
                        hinttext: "22".tr,
                        iconData: Icons.phone_android_outlined,
                        labeltext: "21".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        obscureText: controller.isshowpassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 30, "password");
                        },
                        mycontroller: controller.password,
                        hinttext: "Enter Your Password".tr,
                        iconData: Icons.lock_outline,
                        labeltext: "Password".tr,
                        isPassword: true,
                        // mycontroller: ,
                      ),
                      CustomButtomAuth(
                          text: "17".tr,
                          onPressed: () {
                            controller.signUp();
                          }),
                      const SizedBox(height: 20),
                      CustomTextSignUpOrSignIn(
                        textone: "Already Have an Account? ".tr,
                        texttwo: "Sign In".tr,
                        onTap: () {
                          controller.goToSignIn();
                        },
                      ),
                    ]),
                  ),
                )),
          )),
    );
  }
}
