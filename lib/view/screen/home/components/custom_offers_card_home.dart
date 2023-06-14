import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(.7),
          borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        Positioned(
          top: 10,
          right: controller.lang == "en" ? null : -5,
          child: Lottie.asset(AppImageAsset.offers, width: 120, height: 120),
        ),
        Container(
          alignment: Alignment.center,
          height: 150,
          child: ListTile(
            title: Text(title,
                style:
                    titleStyle.copyWith(fontSize: 18, color: AppColor.white)),
            subtitle: Text(body,
                style: bodyStyle.copyWith(color: Colors.white, fontSize: 30)),
          ),
        ),
      ]),
    );
  }
}
