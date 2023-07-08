import 'package:ecommercecourse/controller/notification_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return GetBuilder<NotificationController>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(children: [
                  Center(
                      child: Text(
                    "Notifications",
                    style: titleStyle.copyWith(
                        fontSize: 25,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(height: 20),
                  ...List.generate(
                      controller.data.length,
                      (index) => Container(
                            height: 80,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                                ListTile(
                                  leading: IconButton(
                                    onPressed: () {
                                      controller.deleteNotification(controller
                                          .data[index]['notification_id']);
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                  title: Text(
                                    controller.data[index]
                                        ['notification_title'],
                                    style: titleStyle.copyWith(
                                        color: primaryColor, fontSize: 16),
                                  ),
                                  subtitle: Text(
                                      controller.data[index]
                                          ['notification_body'],
                                      style: bodyStyle.copyWith(
                                          color: primaryColor, fontSize: 14)),
                                ),
                                Positioned(
                                    right: 5,
                                    child: Text(
                                      Jiffy(
                                              controller.data[index]
                                                  ['notification_datetime'],
                                              "yyyy-MM-dd")
                                          .fromNow()
                                          .toString()
                                          .capitalize!,
                                      style: titleStyle.copyWith(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ))
                ]))));
  }
}
