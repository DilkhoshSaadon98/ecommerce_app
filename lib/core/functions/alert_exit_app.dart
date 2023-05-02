import 'dart:io';

import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    backgroundColor: white,
    actions: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
          onPressed: () {
            exit(0);
          },
          child: Text(
            "Confirm".tr,
            style: authStyle.copyWith(fontSize: 13),
          )),
      ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red[400]),
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Cancel".tr,
            style: authStyle.copyWith(fontSize: 13),
          )),
    ],
    title: "Hint".tr,
    titleStyle: authStyle.copyWith(fontSize: 15),
    content: Text(
      'Sure To Exit App?',
      style: authStyle.copyWith(fontSize: 18, color: grey),
    ),
  );
  return Future.value(true);
}
