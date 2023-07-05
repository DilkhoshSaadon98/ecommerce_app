import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Lottie.asset(
        AppImageAsset.login,
        width: 400,
        height: 400,
      ),
    );
  }
}
