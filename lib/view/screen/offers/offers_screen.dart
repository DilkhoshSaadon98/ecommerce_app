import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/offers_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/screen/offers/components/custom_list_item_offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());
   // SearchMixController searchController = Get.put(SearchMixController());
    return GetBuilder<OffersController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Center(
                child: Text(
              "Offers",
              style: titleStyle.copyWith(
                  fontSize: 25,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 20,
            ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:SizedBox(
                        height: Get.height,
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.75, crossAxisCount: 2),
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return CustomListItemsOffers(
                                itemIndex: index,
                                offersModel: controller.data,
                              );
                            }),
                      )
                //ListItemsSearch(listdatamodel: controller.data[1])

                ),
          ],
        ),
      );
    });
  }
}
