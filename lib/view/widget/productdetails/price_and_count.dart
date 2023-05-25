import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  const PriceAndCountItems(
      {Key? key,
      required this.onAdd,
      required this.onRemove,
      required this.price,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = double.parse(price) * int.parse(count);
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: onAdd,
                icon: const Icon(
                  Icons.add,
                  color: AppColor.primaryColor,
                )),
            Container(
                alignment: Alignment.center,
                width: 50,
                child: Text(
                  count,
                  style: titleStyle.copyWith(fontSize: 20, height: 1.1),
                )),
            IconButton(
                onPressed: onRemove,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.red,
                )),
            const Spacer(),
            Text("$price \$",
                style: titleStyle.copyWith(
                  fontSize: 20,
                  color: AppColor.primaryColor,
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Price',
              style: titleStyle.copyWith(
                fontSize: 20,
                color: AppColor.black,
              ),
            ),
            Text('$totalPrice \$',
                style: titleStyle.copyWith(
                  fontSize: 20,
                  color: AppColor.primaryColor,
                ))
          ],
        )
      ],
    );
  }
}
