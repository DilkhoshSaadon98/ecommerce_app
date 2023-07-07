// ignore_for_file: prefer_const_constructors
import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/screen/cart/components/custom_bottom_navgationbar_cart.dart';
import 'package:ecommercecourse/view/screen/cart/components/customitemscartlist.dart';
import 'package:ecommercecourse/view/screen/cart/components/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
            builder: (controller) => BottomNavgationBarCart(
                shipping: "0",
                controllercoupon: controller.controllerCoupon!,
                onApplyCoupon: () {
                  controller.checkcoupon();
                },
                price: "${controller.priceorders}",
                discount: "${controller.discountcoupon}",
                totalprice: "${controller.getTotalPrice()}")),
        body: GetBuilder<CartController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    SizedBox(height: 10),
                    TopCardCart(
                        message:
                            "You Have ${controller.totalcountitems} Items in Your List"),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            controller.data.length,
                            (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await controller
                                      .add(controller.data[index].itemsId!.toString());
                                  controller.refreshPage();
                                },
                                onRemove: () async {
                                  await controller.delete(
                                      controller.data[index].itemsId!.toString());
                                  controller.refreshPage();
                                },
                                imagename:
                                    "${controller.data[index].itemsImage}",
                                name: "${controller.data[index].itemsName}",
                                price:
                                    "${controller.data[index].itemsprice} \$",
                                count:
                                    "${controller.data[index].countitems}"),
                          )
                        ],
                      ),
                    )
                  ],
                )))));
  }
}
