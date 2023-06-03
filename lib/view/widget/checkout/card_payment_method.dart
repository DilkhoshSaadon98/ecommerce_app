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
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: isActive == true
              ? const Color.fromARGB(255, 49, 182, 182)
              : AppColor.white,
          border: Border.all(
              color: const Color.fromARGB(255, 49, 182, 182), width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Text(title,
          style: TextStyle(
              color: isActive == true ? Colors.white : AppColor.secondColor,
              height: 1,
              fontWeight: FontWeight.bold)),
    );
  }
}
