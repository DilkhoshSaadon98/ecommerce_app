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
      height: 220,
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
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Container(
          width: Get.width * .44,
          height: 220,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10),
              color: AppColor.backgroundcolor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${itemsModel.itemsName}",
                style: bodyStyle.copyWith(color: Colors.black, fontSize: 18),
              ),
              Image.network(
                "${AppLink.imagestItems}${itemsModel.itemsImage}",
                height: 110,
                width: 110,
              ),
              Text(
                "\$ ${itemsModel.itemsPrice} ",
                style: bodyStyle.copyWith(color: Colors.black, fontSize: 18),
              )
            ],
          ),
        ),
      );
    });
  }
}
