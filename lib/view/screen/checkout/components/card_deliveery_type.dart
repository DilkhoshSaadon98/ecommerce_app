import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imagename;
  final String title;
  final bool active;
  const CardDeliveryTypeCheckout(
      {Key? key,
      required this.imagename,
      required this.title,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: active ? primaryColor : null,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          imagename,
          width: 60,
        ),
        Text(
          title,
          style: titleStyle.copyWith(
              color: active ? AppColor.secondColor : primaryColor,
              fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
