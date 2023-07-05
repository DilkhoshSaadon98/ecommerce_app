import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool? active;
  const CustomButtonAppBar(
      {Key? key,
      required this.textbutton,
      required this.icondata,
      required this.onPressed,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 30,
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icondata,
            size: 25,
            color: active == true
                ? const Color.fromARGB(255, 4, 96, 182)
                : AppColor.grey2),
      ]),
    );
  }
}
