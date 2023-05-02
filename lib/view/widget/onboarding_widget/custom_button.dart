import 'package:econmerac_app/controller/on_boarding_controller.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOnBoardingButton extends GetView<OnBoardingControllerImp> {
  const CustomOnBoardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.only(bottom: 25),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor, fixedSize: const Size(300, 50)),
          onPressed: () {
            controller.next();
          },
          child: Text(
            'Next',
            style: onBoardingStyle.copyWith(fontSize: 15),
          )),
    );
  }
}
