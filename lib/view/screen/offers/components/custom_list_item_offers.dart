import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/offers_controller.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsOffers extends GetView<OffersController> {
  final List<dynamic> offersModel;
  final int itemIndex;
  // final bool active;
  const CustomListItemsOffers(
      {super.key, required this.offersModel, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    // bool isDiscount = offersModel.itemsDiscount == 0 ? true : false;
    
        Get.put(OffersController());
    return GestureDetector(
      onTap: () {
       // controller.goToPageOffersProductDetails(offersModel[itemIndex]);
      },
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            color: AppColor.backgroundcolor,
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${offersModel[itemIndex]['items_id']}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imagestItems}/${offersModel[itemIndex]['items_image']!}",
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Spacer(),
                    Text(
                        translateDatabase(
                            offersModel[itemIndex]['items_name_ar'],
                            offersModel[itemIndex]['items_name']),
                        style: numberStyle.copyWith(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const Text("Rating", textAlign: TextAlign.center),
                    //     Container(
                    //       alignment: Alignment.bottomCenter,
                    //       height: 22,
                    //       child: Row(
                    //         children: [
                    //           ...List.generate(
                    //               5,
                    //               (index) => const Icon(
                    //                     Icons.star,
                    //                     size: 15,
                    //                   ))
                    //         ],
                    //       ),
                    //     )
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          child: Stack(
                            children: [
                              Text(
                                  "${offersModel[itemIndex]['itemspricedisount']} \$",
                                  style: titleStyle.copyWith(
                                    color: AppColor.primaryColor,
                                  )),
                              offersModel[itemIndex]['items_discount'] != true
                                  ? Positioned(
                                      bottom: -5,
                                      child: Text(
                                          "${offersModel[itemIndex]['items_price']} \$",
                                          style: titleStyle.copyWith(
                                              color: offersModel[itemIndex]
                                                          ['items_discount'] !=
                                                      true
                                                  ? Colors.red
                                                  : AppColor.black,
                                              decoration: offersModel[itemIndex]
                                                          ['items_discount'] !=
                                                      true
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
                                  if (controller.isFavorite[
                                          offersModel[itemIndex]['items_id']] ==
                                      "1") {
                                    controller.setFavorite(
                                        offersModel[itemIndex]['items_id'],
                                        "0");
                                    controller.removeFavorite(
                                        offersModel[itemIndex]['items_id']!
                                            .toString());
                                  } else {
                                    controller.setFavorite(
                                        offersModel[itemIndex]['items_id'],
                                        "1");
                                    controller.addFavorite(
                                        offersModel[itemIndex]['items_id']!
                                            .toString());
                                  }
                                },
                                icon: Icon(
                                  controller.isFavorite[offersModel[itemIndex]
                                              ['items_id']] ==
                                          "1"
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: AppColor.primaryColor,
                                )))
                      ],
                    )
                  ]),
            ),
            offersModel[itemIndex]['items_discount'] != true
                ? Positioned(
                    top: 4,
                    left: 4,
                    child: Image.asset(
                      AppImageAsset.saleOne,
                      width: 40,
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}
