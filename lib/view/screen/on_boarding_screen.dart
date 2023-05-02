import 'package:econmerac_app/controller/on_boarding_controller.dart';
import 'package:econmerac_app/view/widget/onboarding_widget/custom_button.dart';
import 'package:econmerac_app/view/widget/onboarding_widget/custom_dot_list.dart';
import 'package:econmerac_app/view/widget/onboarding_widget/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Expanded(
            flex: 3,
            child: CustomSlider(),
          ),
          Expanded(
              child: Column(
            children: const [
              CustomDotList(),
              Spacer(flex: 2),
              CustomOnBoardingButton()
            ],
          ))
        ],
      )),
    );
  }
}
