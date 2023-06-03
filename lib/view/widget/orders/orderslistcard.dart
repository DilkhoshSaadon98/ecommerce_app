import 'package:ecommercecourse/controller/orders/pending_controller.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;

  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    print(Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow());
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: titleStyle.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                    style: titleStyle.copyWith(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(
                thickness: 1,
                color: AppColor.primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Type : ", style: titleStyle),
                  Text(
                      " ${controller.printOrderType(listdata.ordersType!.toString())}",
                      style: titleStyle),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Price : ", style: titleStyle),
                  Text(" ${listdata.ordersPrice} \$", style: titleStyle),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Price : ", style: titleStyle),
                  Text(" ${listdata.ordersPricedelivery} \$",
                      style: titleStyle),
                ],
              ),
              GetBuilder<OrdersPendingController>(builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Payment Method : : ", style: titleStyle),
                    Text(
                        " ${controller.printPaymentMethod(listdata.ordersPaymentmethod.toString())} ",
                        style: titleStyle),
                  ],
                );
              }),
              GetBuilder<OrdersPendingController>(builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Status : ", style: titleStyle),
                    Text(
                        " ${controller.printOrderStatus(listdata.ordersStatus.toString())} ",
                        style: titleStyle),
                  ],
                );
              }),
              const Divider(
                thickness: 1,
                color: AppColor.primaryColor,
              ),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersId} \$ ",
                      style: titleStyle.copyWith(
                          fontSize: 18,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    icon: const Icon(Icons.info_outline),
                    color: const Color.fromARGB(255, 49, 182, 182),
                  ),
                  if (listdata.ordersStatus! == 0)
                    IconButton(
                      onPressed: () {
                        controller.deleteOrder(listdata.ordersId!.toString());
                      },
                      color: Colors.red,
                      icon: const Icon(Icons.remove_circle_outline),
                    )
                ],
              ),
            ],
          )),
    );
  }
}
