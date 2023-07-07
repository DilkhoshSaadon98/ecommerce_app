import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardPaymentMethodCheckout extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckout(
      {Key? key, required this.title, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: isActive == true ? AppColor.primaryColor : AppColor.white,
          border: Border.all(color: AppColor.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Text(title,
          style: titleStyle.copyWith(
              color: isActive == true
                  ? AppColor.secondColor
                  : AppColor.primaryColor,
              height: 1,
              fontSize: 16,
              fontWeight: FontWeight.bold)),
    );
  }
}
