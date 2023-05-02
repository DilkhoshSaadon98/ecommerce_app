import 'package:econmerac_app/core/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class FooterText extends StatelessWidget {
  String title;
  String buttonTitle;
  Callback press;
  FooterText({
    required this.title,
    required this.buttonTitle,
    required this.press,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: authStyle.copyWith(fontSize: 15),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            buttonTitle,
            style: authStyle.copyWith(fontSize: 15, color: primaryColor),
          ),
        ),
      ],
    );
  }
}
