import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/controller/items/offers_controller.dart';
import 'package:home_food/data/model/categories_model.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../likeapi.dart';

class CustomListItemsOffers extends GetView<OffersControllerImp> {
  final CategoriesModel categoriesModel;
  final List categories;
  final int i;

  const CustomListItemsOffers({
    Key? key,
    required this.categoriesModel,
    required this.i,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(categoriesModel, i, categoriesModel.categoriesId!);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 50,
                      backgroundImage: CachedNetworkImageProvider(
                        "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",

                        // fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    width: 18,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translateDataBase(
                            categoriesModel.categoriesNameAr.toString(),
                            categoriesModel.categoriesName.toString()),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        translateDataBase(
                            categoriesModel.governorateNameAr.toString(),
                            categoriesModel.governorateNameEn.toString()),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      Text(
                        translateDataBase(
                            categoriesModel.addressStreet.toString(),
                            categoriesModel.addressStreet.toString()),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10,color: Colors.grey),
                      ),
                      Container(
                          alignment: Alignment.bottomCenter,
                          height: 22,
                          child: Row(
                            children: [
                              ...List.generate(
                                  5,
                                  (index) => Icon(
                                        Icons.star,
                                        size: 15,
                                        color: AppColor.primaryColor
                                            .withOpacity(0.5),
                                      )),
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
