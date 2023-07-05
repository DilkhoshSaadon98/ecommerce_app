import 'package:ecommercecourse/view/screen/cart/cart_screen.dart';
import 'package:ecommercecourse/view/screen/home/home_screen.dart';
import 'package:ecommercecourse/view/screen/notifications/notification_screen.dart';
import 'package:ecommercecourse/view/screen/offers/offers_screen.dart';
import 'package:ecommercecourse/view/screen/setting/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainScreenController extends GetxController {
  changePage(int currentpage);
}

class MainScreenControllerImp extends MainScreenController {
  int currentpage = 1;

  List<Widget> listPage = const [
    HomePageScreen(),
    CartScreen(),
    NotificationView(),
    OffersScreen(),
    Settings()
  ];

  List bottomappbar = [
    {
      "title": "Dashboard",
      "outlined_icon": Icons.home_outlined,
      'fiiled_icon': Icons.home
    },
    {
      "title": "Cart",
      "outlined_icon": Icons.shopping_basket_outlined,
      'fiiled_icon': Icons.shopping_basket
    },
    {
      "title": "Notifi",
      "outlined_icon": Icons.notifications_active_outlined,
      'fiiled_icon': Icons.notifications_active
    },
    {
      "title": "Offers",
      "outlined_icon": Icons.discount_outlined,
      'fiiled_icon': Icons.discount
    },
    {
      "title": "Setting",
      "outlined_icon": Icons.settings_outlined,
      'fiiled_icon': Icons.settings
    }
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int index) {
    currentpage = index;
    update();
  }
}
