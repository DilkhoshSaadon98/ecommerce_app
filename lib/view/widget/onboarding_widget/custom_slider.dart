import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:econmerac_app/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/on_boarding_controller.dart';

class CustomSlider extends GetView<OnBoardingControllerImp> {
  const CustomSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.onPageChanged(value);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  onBoardingList[i].image!,
                  width: 300,
                ),
                const SizedBox(
                  height: 35 ,
                ),
                Text(
                  onBoardingList[i].title!,
                  style: onBoardingStyle,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: onBoardingStyle.copyWith(
                      height: 2,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: grey,
                    ),
                  ),
                ),
              ],
            ));
  }
}
