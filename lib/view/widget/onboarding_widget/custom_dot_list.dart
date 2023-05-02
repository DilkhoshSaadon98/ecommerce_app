import 'package:econmerac_app/controller/on_boarding_controller.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:econmerac_app/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomDotList extends StatelessWidget {
  const CustomDotList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (contoller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 700),
                          width: contoller.currentPage == index ? 17 : 5,
                          height: 5,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: primaryColor,
                          ),
                        ))
              ],
            ));
  }
}
