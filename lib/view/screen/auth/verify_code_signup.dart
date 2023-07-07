import 'package:ecommercecourse/controller/auth/verfiy_code_signup_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/screen/auth/components/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'components/custom_textbody_auth.dart';
import 'components/custom_texttitle_auth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView(children: [
                  const SizedBox(height: 50),
                  Text(
                    'Verification Code',
                    style: titleStyle.copyWith(fontSize: 30),
                  ),
                  const SizedBox(height: 70),
                  const CustomTextTitleAuth(text: "Check code"),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(
                      text: "Please Enter The Digit Code Sent To "),
                  Text(
                    "${controller.email.toString().capitalizeFirst}",
                    style: titleStyle.copyWith(
                        fontSize: 18, color: AppColor.secondColor),
                  ),
                  const SizedBox(height: 15),
                  OtpTextField(
                    fieldWidth: 50.0,
                    borderRadius: BorderRadius.circular(10),
                    numberOfFields: 5,
                    borderColor: primaryColor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                  const Spacer(),
                  CustomButtomAuth(
                    text: "Resend Code",
                    onPressed: () {
                      controller.reSend();
                    },
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        width: Get.width,
                        height: 45,
                        padding: const EdgeInsets.only(bottom: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1, color: primaryColor)),
                        child: Text(
                          "Back To Login",
                          style: titleStyle.copyWith(fontSize: 16),
                        )),
                  )
                ]),
              ))),
    );
  }
}
