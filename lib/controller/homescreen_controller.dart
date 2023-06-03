import 'package:ecommercecourse/view/screen/main_screen_tabs/home_screen.dart';
import 'package:ecommercecourse/view/screen/main_screen_tabs/notification_screen.dart';
import 'package:ecommercecourse/view/screen/setting/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = const[
     HomePage(),
    NotificationView() , 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Profile"))],
    ),
    Settings()
  ];

  List bottomappbar = [
    {"title": "home", "icon": Icons.home},
    {"title": "n", "icon": Icons.notifications_active_outlined},
    {"title": "profile", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings}
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int index) {
    currentpage = index;
    update();
  }
}
