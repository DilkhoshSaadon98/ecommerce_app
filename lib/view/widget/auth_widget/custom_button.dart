import 'package:econmerac_app/controller/on_boarding_controller.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class CustomAuthButton extends GetView<OnBoardingControllerImp> {
  String title;
  Callback press;
  CustomAuthButton({
    super.key,
    required this.title,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor, fixedSize: Size(Get.width, 50)),
          onPressed: press,
          child: Text(
            title,
            style: onBoardingStyle.copyWith(fontSize: 15),
          )),
    );
  }
}
