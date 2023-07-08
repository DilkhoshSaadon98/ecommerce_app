import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:ecommercecourse/view/screen/home/home_screen.dart';
import 'package:ecommercecourse/view/widget/customappbar.dart';
import 'package:ecommercecourse/view/screen/items/components/custom_list_items.dart';
import 'package:ecommercecourse/view/screen/items/components/list_categoirse_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: primaryColor,
            ),
            onPressed: () {
              Get.back();
            }),
        centerTitle: false,
        title: Text(
          'Products',
          style: titleStyle.copyWith(fontSize: 22),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          CustomAppBar(
            mycontroller: controller.search!,
            titleAppBar: "Find Product",
            onPressedSearch: () {
              controller.onSearchItems();
            },
            onChanged: (val) {
              controller.checkSearch(val);
            },
          ),
          const SizedBox(height: 10),
          const ListCategoriesItems(),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.8),
                          itemBuilder: (BuildContext context, index) {
                            controllerFav.isFavorite[controller.data[index]
                                    ['items_id']] =
                                controller.data[index]['favorite'];
                            return CustomListItems(
                                itemsModel: ItemsModel.fromJson(
                                    controller.data[index]));
                          })
                      : ListItemsSearch(listdatamodel: controller.listdata2)))
        ]),
      ),
    );
  }
}





















// favoriteController.isFavorite[controller.data[index]
                            // ['items_id']] = controller.data[index]['favorite'];
