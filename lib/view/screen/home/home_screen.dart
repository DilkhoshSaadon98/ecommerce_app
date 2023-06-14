import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/view/screen/home/components/custom_title_home.dart';
import 'package:ecommercecourse/view/screen/home/components/list_categories_home.dart';
import 'package:ecommercecourse/view/screen/home/components/list_items_home.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                //! App Bar When Search Start :
                !controller.isSearch
                    ? Container()
                    : CustomAppBar(
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
                    widget: !controller.isSearch
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.toNamed(AppRoute.myfavroite);
                                      },
                                      icon: const Icon(
                                        Icons.table_restaurant_outlined,
                                        color: AppColor.primaryColor,
                                        size: 30,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        Get.toNamed(AppRoute.myfavroite);
                                      },
                                      icon: const Icon(
                                        Icons.favorite_outline,
                                        color: AppColor.primaryColor,
                                        size: 30,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Welcome, ',
                                    style: titleStyle.copyWith(
                                        fontSize: 26,
                                        color: AppColor.black,
                                        height: 1),
                                  ),
                                  Text(
                                    '${controller.username!.capitalizeFirst}',
                                    style: titleStyle.copyWith(
                                        fontSize: 26,
                                        color: AppColor.primaryColor,
                                        height: 1),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomAppBar(
                                mycontroller: controller.search!,
                                titleAppBar: "Search",
                                // onPressedIcon: () {},
                                onPressedSearch: () {
                                  controller.onSearchItems();
                                },
                                onChanged: (val) {
                                  controller.checkSearch(val);
                                },
                              ),
                              const CustomTitleHome(title: "Menu"),
                              const ListCategoriesHome(),
                              const CustomTitleHome(title: "Foods for you"),
                              const ListItemsHome(),
                            ],
                          )
                        : ListItemsSearch(listdatamodel: controller.listdata2))

                // const CustomTitleHome(title: "Offer"),
                // const ListItemsHome()
              ],
            )));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
