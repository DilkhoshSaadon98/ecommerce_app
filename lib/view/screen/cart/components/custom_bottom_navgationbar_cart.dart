import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/screen/cart/components/buttoncart.dart';
import 'package:ecommercecourse/view/screen/cart/components/custom_button_coupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: const InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                hintText: "Coupon Code",
                                border: OutlineInputBorder()),
                          )),
                      const SizedBox(width: 5),
                      Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textbutton: "Apply",
                            onPressed: onApplyCoupon,
                          ))
                    ]))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coupon Code:".toUpperCase(),
                          style: titleStyle.copyWith(
                              color: AppColor.primaryColor, fontSize: 20),
                        ),
                        Text(
                          "' ${controller.couponname!.toUpperCase()}'",
                          style: titleStyle.copyWith(
                              color: AppColor.primaryColor, fontSize: 20),
                        ),
                      ],
                    ),
                  )),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Price",
                        style: titleStyle.copyWith(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$price \$", style: numberStyle))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Discount",
                        style: titleStyle.copyWith(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$discount %", style: numberStyle))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Shipping",
                        style: titleStyle.copyWith(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$shipping ", style: numberStyle))
              ],
            ),
            const Divider(
              thickness: 1,
              color: AppColor.primaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Total Price",
                        style: titleStyle.copyWith(fontSize: 16))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$totalprice \$", style: numberStyle))
              ],
            ),
          ]),
        ),
        const SizedBox(height: 10),
        CustomButtonCart(
          textbutton: "Check Out",
          onPressed: () {
            controller.goToPageCheckout();
          },
        )
      ],
    );
  }
}
