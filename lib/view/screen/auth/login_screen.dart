import 'package:ecommercecourse/controller/auth/login_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/functions/alert_exit_app.dart';
import 'package:ecommercecourse/core/functions/validinput.dart';
import 'package:ecommercecourse/view/screen/auth/components/custom_texttitle_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/custom_button_auth.dart';
import 'components/custom_textbody_auth.dart';
import 'components/custom_textform_auth.dart';
import 'components/logo_auth.dart';
import 'components/text_signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      const LogoAuth(
                        title: AppImageAsset.login,
                      ),
                      const SizedBox(height: 10),
                      CustomTextTitleAuth(text: "Welcome Back".tr),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(
                          text:
                              "Sign In Your Email And Password Or  Continue With Social Media"
                                  .tr),
                      const SizedBox(height: 30),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 3, 100, "username");
                        },
                        mycontroller: controller.email,
                        hinttext: "E-mail".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "E-mail or Username".tr,
                        // mycontroller: ,
                      ),
                      const SizedBox(height: 10),
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
                      Container(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            "Forget Password".tr,
                            textAlign: TextAlign.right,
                            style: titleStyle.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      CustomButtomAuth(
                          text: "Log In".tr,
                          onPressed: () {
                            controller.login();
                          }),
                      const SizedBox(height: 15),
                      CustomTextSignUpOrSignIn(
                        textone: "Dont Have An Account ? ".tr,
                        texttwo: "Sign Up".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      )
                    ]),
                  ),
                )),
          )),
    );
  }
}
