import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    bool isDiscount = itemsModel.itemsDiscount == 0 ? true : false;
    //! Get.put(ItemsControllerImp());
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Spacer(),
                      Text(
                          translateDatabase(
                              itemsModel.itemsNameAr, itemsModel.itemsName),
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Rating", textAlign: TextAlign.center),
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: 22,
                            child: Row(
                              children: [
                                ...List.generate(
                                    5,
                                    (index) => const Icon(
                                          Icons.star,
                                          size: 15,
                                        ))
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                            child: Stack(
                              children: [
                                Text("${itemsModel.itemsPriceDiscount} \$",
                                    style: titleStyle.copyWith(
                                      color: AppColor.primaryColor,
                                    )),
                                isDiscount != true
                                    ? Positioned(
                                        bottom: -5,
                                        child: Text(
                                            "${itemsModel.itemsPrice} \$",
                                            style: titleStyle.copyWith(
                                                color: isDiscount != true
                                                    ? Colors.red
                                                    : AppColor.black,
                                                decoration: isDiscount != true
                                                    ? TextDecoration.lineThrough
                                                    : TextDecoration.none)),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          GetBuilder<FavoriteController>(
                              builder: (controller) => IconButton(
                                  onPressed: () {
                                    if (controller
                                            .isFavorite[itemsModel.itemsId] ==
                                        "1") {
                                      controller.setFavorite(
                                          itemsModel.itemsId, "0");
                                      controller.removeFavorite(
                                          itemsModel.itemsId!.toString());
                                    } else {
                                      controller.setFavorite(
                                          itemsModel.itemsId, "1");
                                      controller.addFavorite(
                                          itemsModel.itemsId!.toString());
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsModel.itemsId] ==
                                            "1"
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: AppColor.primaryColor,
                                  )))
                        ],
                      )
                    ]),
              ),
              // ignore: unrelated_type_equality_checks
              isDiscount != true
                  ? Positioned(
                      top: 4,
                      left: 4,
                      child: Image.asset(
                        AppImageAsset.saleOne,
                        width: 30,
                      ))
                  : Container()
            ],
          ),
        ));
  }
}
