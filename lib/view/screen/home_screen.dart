import 'package:dartz/dartz.dart';
import 'package:econmerac_app/controller/home_controller.dart';
import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:econmerac_app/core/constant/image_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      backgroundColor: white,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  style: homeStyle,
                  decoration: InputDecoration(
                      hintText: 'Find Product',
                      hintStyle: homeStyle,
                      fillColor: primaryColor.withOpacity(.3),
                      filled: true,
                      prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: black,
                          )),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15))),
                )),
                // const SizedBox(
                //   width: 10,
                // ),
                // Container(
                //   width: 60,
                //   height: 60,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //       color: primaryColor.withOpacity(.3)),
                //   child: IconButton(
                //       onPressed: () {},
                //       icon: Icon(
                //         Icons.notifications_outlined,
                //         color: black,
                //       )),
                // )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    title: Text(
                      'Summer Suprice',
                      style: homeStyle.copyWith(fontSize: 15),
                    ),
                    subtitle: Text(
                      'Cash Back 25%',
                      style: homeStyle.copyWith(fontSize: 25),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Lottie.asset(AppImageAssets.offers,
                        width: 135, height: 135))
              ],
            ),
          )
        ],
      ),
    );
  }
}
