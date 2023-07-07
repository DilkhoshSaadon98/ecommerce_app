import 'package:ecommercecourse/controller/auth/successsignup_controller.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/view/screen/auth/components/logo_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/custom_button_auth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(
            flex: 1,
          ),
          const Center(
            child: LogoAuth(
              title: AppImageAsset.successCreateAccount,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "Go To Login".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
