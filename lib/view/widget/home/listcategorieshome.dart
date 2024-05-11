import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../data/model/categories_model.dart';
import '../../../likeapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.12,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: ((context, index) {
          return CategoriesHome(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]));
        }),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 15,
        ),
      ),
    );
  }
}

class CategoriesHome extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const CategoriesHome(
      {Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: () {
          controller.goToItems(categoriesModel, i!, categoriesModel.categoriesId!);
        },
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: CachedNetworkImageProvider(
                  "${AppLink.imageCategories}/${categoriesModel.categoriesImage}"),
            ),
            Text(
              translateDataBase(categoriesModel.categoriesNameAr.toString(),
                  categoriesModel.categoriesName.toString()),
              style: const TextStyle(fontSize: 14),
            )
          ],
        ));
  }
}
