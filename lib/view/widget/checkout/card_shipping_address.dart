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
      color: isactive ? const Color.fromARGB(255, 49, 182, 182) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(
          Icons.location_on,
          color: isactive ? Colors.white : Colors.black,
        ),
        title: Text(title,
            style: titleStyle.copyWith(
                fontSize: 18,
                color: isactive ? Colors.white : null,
                fontWeight: FontWeight.w700)),
        subtitle: Text(body,
            style: titleStyle.copyWith(
                fontSize: 14,
                color: isactive ? Colors.white : null,
                fontWeight: FontWeight.w100)),
      ),
    );
  }
}
