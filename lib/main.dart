import 'package:econmerac_app/core/constant/app_routes.dart';
import 'package:econmerac_app/core/localization/change_local.dart';
import 'package:econmerac_app/core/localization/transaltion.dart';
import 'package:econmerac_app/routes.dart';
import 'package:econmerac_app/core/services/services.dart';
import 'package:econmerac_app/view/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    MyLocalController myLocalController = Get.put(MyLocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Translation(),
      locale: myLocalController.language,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: routes,
    );
  }
}
