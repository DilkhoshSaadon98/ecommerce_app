import 'package:ecommercecourse/controller/checkout_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/view/widget/checkout/card_deliveery_type.dart';
import 'package:ecommercecourse/view/widget/checkout/card_payment_method.dart';
import 'package:ecommercecourse/view/widget/checkout/card_shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: titleStyle.copyWith(fontSize: 25),
        ),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secondColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text("Checkout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )),
      body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Text(
                        "Choose Payment Method",
                        style: titleStyle.copyWith(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0");
                        },
                        child: CardPaymentMethodCheckout(
                            title: "Cash On Delivery",
                            isActive: controller.paymentMethod == "0" // cash
                                ? true
                                : false),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("1");
                        },
                        child: CardPaymentMethodCheckout(
                            title: "Payment Cards",
                            isActive: controller.paymentMethod == "1" // Card
                                ? true
                                : false),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Choose Delivery Type",
                        style: titleStyle.copyWith(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              controller
                                  .chooseDeliveryType("0"); // 0 => Delivery
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.deliveryImage2,
                                title: "Delivery",
                                active: controller.deliveryType == "0"
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1"); // 1 => recive
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.drivethruImage,
                                title: "Revice",
                                active: controller.deliveryType == "1"
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (controller.deliveryType == "0")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shipping Address",
                              style: titleStyle.copyWith(
                                  color: AppColor.secondColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            ...List.generate(
                              controller.dataaddress.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.getShippingAddress();
                                  controller.chooseShippingAddress(controller
                                      .dataaddress[index].addressId!
                                      .toString());
                                },
                                child: CardShppingAddressCheckout(
                                    title:
                                        "${controller.dataaddress[index].addressName}",
                                    body:
                                        "${controller.dataaddress[index].addressCity}  - ${controller.dataaddress[index].addressStreet}",
                                    isactive: controller.addressid ==
                                            controller
                                                .dataaddress[index].addressId
                                                .toString()
                                        ? true
                                        : false),
                              ),
                            )
                          ],
                        )
                    ],
                  )))),
    );
  }
}
