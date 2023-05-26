import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .44,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.primaryColor.withOpacity(.9)),
      child: Card(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.network(
                "${AppLink.imagestItems}${itemsModel.itemsImage}",
                height: 170,
                width: 100,
              ),
            ),
            Positioned(
                left: 10,
                child: Text(
                  "${itemsModel.itemsName}",
                  style: bodyStyle.copyWith(color: Colors.black, fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
