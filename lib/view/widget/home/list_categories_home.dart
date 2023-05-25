import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constant/apptheme.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/functions/translatefatabase.dart';
import 'package:ecommercecourse/data/model/categories_model.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            itemColor:
                controller.listColor[index % controller.listColor.length],
            i: index,
            categoriesModel:
                CatagoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CatagoriesModel categoriesModel;
  final int? i;
  final Color? itemColor;
  const Categories({
    Key? key,
    required this.categoriesModel,
    required this.i,
    required this.itemColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!,
            categoriesModel.catagoriesId!.toString());
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: itemColor, borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
                "${AppLink.imagestCategories}${categoriesModel.catagoriesImage}",
                color: AppColor.black),
          ),
          Text(
            "${translateDatabase(categoriesModel.catagoriesNamaAr, categoriesModel.catagoriesName)}",
            style: titleStyle,
          )
        ],
      ),
    );
  }
}
