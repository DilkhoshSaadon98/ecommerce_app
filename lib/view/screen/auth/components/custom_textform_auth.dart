import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final bool? isPassword;
  final void Function()? onTapIcon;

  const CustomTextFormAuth(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
          keyboardType: isNumber
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          validator: valid,
          controller: mycontroller,
          obscureText:
              obscureText == null || obscureText == false ? false : true,
          decoration: InputDecoration(
            // hintText: hinttext,
            // hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(
                  labeltext,
                  style: titleStyle.copyWith(fontSize: 16),
                )),
            suffixIcon: isPassword == true
                ? IconButton(
                    onPressed: onTapIcon,
                    icon: Icon(
                      obscureText == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: primaryColor,
                    ))
                : Container(),
            prefixIcon: Icon(
              iconData,
              color: primaryColor,
            ),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.thirdColor, width: 2)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryColor, width: 2)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 2)),
          )),
    );
  }
}
