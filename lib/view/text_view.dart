import 'package:econmerac_app/controller/text_controller.dart';
import 'package:econmerac_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<TestController>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.statusRequest == StatusRequest.offlineFailure) {
          return const Center(
            child: Text("Offline Faliuer"),
          );
        }
        else if (controller.statusRequest == StatusRequest.serverFaliure) {
          return const Center(
            child: Text("Offline Faliuer"),
          );
        }else{
          return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context , i){
            return Text("${controller.data}");
          });
        }
      })
    );
  }
}
