import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  final String message;
  const TopCardCart({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 3),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      decoration: BoxDecoration(
        color: AppColor.secondColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(message, textAlign: TextAlign.center, style: titleStyle),
    );
  }
}
