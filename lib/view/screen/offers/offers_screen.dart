import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/offers_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/screen/offers/components/custom_list_item_offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());
    SearchMixController searchController = Get.put(SearchMixController());
    return GetBuilder<OffersController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: [
            CustomAppBar(
              mycontroller: controller.search!,
              titleAppBar: "Find Product",
              // onPressedIcon: () {},
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
            ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !searchController.isSearch
                    ? SizedBox(
                        height: Get.height,
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.7, crossAxisCount: 2),
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              return CustomListItemsOffers(
                                itemIndex: index,
                                offersModel: controller.data,
                              );
                            }),
                      )
                    : Container()
                //ListItemsSearch(listdatamodel: controller.data[1])

                ),
          ],
        ),
      );
    });
  }
}
