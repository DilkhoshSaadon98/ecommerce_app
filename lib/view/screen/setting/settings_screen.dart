import 'package:ecommercecourse/controller/settings_controller.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return ListView(
      children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(height: Get.height / 5.5, color: AppColor.primaryColor),
          Positioned(
              top: Get.height / 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[100],
                  backgroundImage: const AssetImage(AppImageAsset.avatar),
                ),
              )),
        ]),
        const SizedBox(height: 75),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                // onTap: () {},
                trailing: Switch(
                    activeColor: AppColor.primaryColor,
                    onChanged: (val) {},
                    value: true),
                title: Text(
                  "Disable Notificatios",
                  style: titleStyle.copyWith(fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoute.orderspending);
                },
                trailing: const Icon(
                  Icons.card_travel,
                  color: AppColor.black,
                ),
                title: Text(
                  "Orders",
                  style: titleStyle.copyWith(fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoute.ordersarchive);
                },
                trailing: const Icon(
                  Icons.archive_outlined,
                  color: AppColor.black,
                ),
                title: Text(
                  "Archive",
                  style: titleStyle.copyWith(fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoute.addressview);
                },
                trailing: const Icon(
                  Icons.location_on_outlined,
                  color: AppColor.black,
                ),
                title: Text(
                  "Address",
                  style: titleStyle.copyWith(fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {},
                trailing: const Icon(
                  Icons.help_outline_rounded,
                  color: AppColor.black,
                ),
                title: Text(
                  "About us",
                  style: titleStyle.copyWith(fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {},
                trailing: const Icon(
                  Icons.phone_callback_outlined,
                  color: AppColor.black,
                ),
                title: Text(
                  "Contact us",
                  style: titleStyle.copyWith(fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  controller.logout();
                },
                title: Text(
                  "Logout",
                  style: titleStyle.copyWith(fontSize: 16),
                ),
                trailing: const Icon(
                  Icons.exit_to_app,
                  color: AppColor.black,
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
