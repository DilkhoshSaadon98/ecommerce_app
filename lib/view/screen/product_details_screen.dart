import 'package:ecommercecourse/controller/productdetails_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/productdetails/price_and_count.dart';
import 'package:ecommercecourse/view/widget/productdetails/subitemslist.dart';
import 'package:ecommercecourse/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends GetView<ProductDetailsControllerImp> {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());

    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Text(
                  "Go To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => ListView(children: [
                  const TopProductPageDetails(),
                  const SizedBox(
                    height: 100,
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${controller.itemsModel.itemsName}",
                                  style: titleStyle.copyWith(
                                    fontSize: 20,
                                    color: AppColor.fourthColor,
                                  )),
                              const SizedBox(height: 10),
                              //! Price And Count Items :
                              PriceAndCountItems(
                                  onAdd: () {
                                    controller.add();
                                  },
                                  onRemove: () {
                                    controller.remove();
                                  },
                                  price: "${controller.itemsModel.itemsPrice}",
                                  count: "${controller.countitems}"),
                              const Divider(
                                thickness: 1,
                                color: AppColor.primaryColor,
                              ),
                              Text(
                                "Description:",
                                style: titleStyle.copyWith(fontSize: 20),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                    "${controller.itemsModel.itemsDesc}",
                                    style: titleStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: AppColor.grey2)),
                              ),
                              const Divider(
                                thickness: 1,
                                color: AppColor.primaryColor,
                              ),
                              Text("Color",
                                  style: titleStyle.copyWith(
                                    fontSize: 20,
                                    color: AppColor.black,
                                  )),
                              const SizedBox(height: 10),
                              const SubitemsList()
                            ]),
                      ))
                ])));
  }
}
