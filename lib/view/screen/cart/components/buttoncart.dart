import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonCart extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonCart({Key? key, required this.textbutton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 50,
        width: Get.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(5)),
        child:
            Text(textbutton, style: titleStyle.copyWith(color: AppColor.white)),
      ),
    );
  }
}
