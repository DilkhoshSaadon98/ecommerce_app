import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardShppingAddressCheckout extends StatelessWidget {
  final String title;
  final String body;
  final bool isactive;
  const CardShppingAddressCheckout(
      {Key? key,
      required this.title,
      required this.body,
      required this.isactive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isactive ? primaryColor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(
          Icons.location_on,
          color: isactive ? AppColor.secondColor : primaryColor,
        ),
        title: Text(title,
            style: titleStyle.copyWith(
                fontSize: 16,
                color: isactive ? AppColor.secondColor : null,
                fontWeight: FontWeight.w700)),
        subtitle: Text(body,
            style: titleStyle.copyWith(
                fontSize: 12,
                color: isactive ? AppColor.secondColor : null,
                fontWeight: FontWeight.w100)),
      ),
    );
  }
}
