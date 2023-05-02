import 'package:econmerac_app/core/services/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MyLocalController extends GetxController {
  MyServices myServices = Get.find();
  Locale? language;
  // Locale initialLang =
  //     myServices.sharedPreferences.getString("lang") == "Arabic"
  //         ? Locale("Arabic")
  //         : Locale("English");

  void changLang(String langCode) {
    Locale local = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(local);
  }

  @override
  void onInit() {
    String? langSharedPref = myServices.sharedPreferences.getString('lang');
    if (langSharedPref == 'ar') {
      language = const Locale('ar');
    } else if (langSharedPref == 'en') {
      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
