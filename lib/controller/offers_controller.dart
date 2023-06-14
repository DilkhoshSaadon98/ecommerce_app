import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/handing_data_controller.dart';
import 'package:ecommercecourse/data/datasource/remote/offers_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());

  List<dynamic> data = [];

  @override
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.getData();
    //print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        data.addAll(response['data']!);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("/productdetails", arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
