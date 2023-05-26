import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widget/cart/buttoncart.dart';
import 'package:ecommercecourse/view/widget/cart/custombuttoncoupon.dart';
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
        builder: (controller) =>
        controller.couponname == null ? 
         Container(
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
                    textbutton: "apply",
                    onPressed: onApplyCoupon,
                  ))
            ]))
            : Text("Coupon Code ${controller.couponname!}" , style: const TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),)
            ),
    Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("price", style: TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$price \$", style: titleStyle))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("discount", style: titleStyle)),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$discount ", style: titleStyle))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("shipping", style: titleStyle)),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$shipping ", style: titleStyle))
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Total Price",
                    style: titleStyle)),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$totalprice \$",
                    style: titleStyle))
          ],
        ),
      ]),
    ),
    const SizedBox(height: 10),
    CustomButtonCart(
      textbutton: "Order",
      onPressed: () { 
        controller.goToPageCheckout() ; 
      },
    )
      ],
    );
  }
}
