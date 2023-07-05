import 'package:ecommercecourse/controller/main_screen_controller.dart';
import 'package:ecommercecourse/view/widget/bottom_bar/custom_button_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(controller.listPage.length, ((index) {
                  return CustomButtonAppBar(
                      textbutton: controller.bottomappbar[index]['title'],
                      icondata: controller.currentpage == index
                          ? controller.bottomappbar[index]['fiiled_icon']
                          : controller.bottomappbar[index]['outlined_icon'],
                      onPressed: () {
                        controller.changePage(index);
                      },
                      active: controller.currentpage == index ? true : false);
                }))
              ],
            )));
  }
}
