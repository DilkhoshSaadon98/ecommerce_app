import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:econmerac_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('onBoarding') == '1') {
      return const RouteSettings(name: AppRoutes.loginScreen);
    }
  }
}
