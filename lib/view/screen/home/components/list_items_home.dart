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
      height: 200,
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
          margin: const EdgeInsets.only(right: 10, top: 30),
          child: Card(
            color: AppColor.backgroundcolor,
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -80,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.network(
                      "${AppLink.imagestItems}${itemsModel.itemsImage}",
                      height: 170,
                      width: 100,
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${itemsModel.itemsName}",
                          style: bodyStyle.copyWith(
                              color: Colors.black, fontSize: 20),
                        ),
                        Text(
                          "${itemsModel.itemsPrice} \$",
                          style: bodyStyle.copyWith(
                              color: Colors.black, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
