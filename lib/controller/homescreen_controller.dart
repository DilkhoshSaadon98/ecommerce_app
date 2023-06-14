
import 'package:ecommercecourse/view/screen/home/home_screen.dart';
import 'package:ecommercecourse/view/screen/notifications/notification_screen.dart';
import 'package:ecommercecourse/view/screen/offers/offers_screen.dart';
import 'package:ecommercecourse/view/screen/setting/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = const [
    HomePageScreen(),
    NotificationView(),
    OffersScreen(),
    Settings()
  ];

  List bottomappbar = [
    {"title": "Dashboard", "icon": Icons.home},
    {"title": "Notifi", "icon": Icons.notifications_active_outlined},
    {"title": "Offers", "icon": Icons.discount_outlined},
    {"title": "Setting", "icon": Icons.settings}
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int index) {
    currentpage = index;
    update();
  }
}
