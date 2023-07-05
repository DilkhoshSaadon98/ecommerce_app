
import 'package:ecommercecourse/controller/main_screen_controller.dart';
import 'package:ecommercecourse/core/functions/alert_exit_app.dart';
import 'package:ecommercecourse/view/widget/bottom_bar/custom_bottom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenControllerImp());
    return GetBuilder<MainScreenControllerImp>(
        builder: (controller) => Scaffold(
              
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: WillPopScope(onWillPop: alertExitApp, child: controller.listPage.elementAt(controller.currentpage)),
            ));
  }
}
