import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/controller/items/items_controller.dart';
import 'package:home_food/data/model/itemsmodel.dart';
import '../../../core/constant/color.dart';
import '../../../core/dimensions.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../likeapi.dart';
import '../../widget/home/listitems.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final bool active;

  const CustomListItems({
    Key? key,
    required this.itemsModel,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Row(
          children: [
            //Image Section
            Container(
              width: Dimensions.listViewImgSize,
              height: Dimensions.listViewImgSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white38,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          "${AppLink.imageItems}/${itemsModel.itemsImage}"))),
            ),
            //Text Container
            Expanded(
              child: Container(
                height: Dimensions.listViewTextContSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    bottomRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white38,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(
                          text:
                              "${translateDataBase(itemsModel.itemsNameAr, itemsModel.itemsName)}"),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      SmallText(
                          text:
                              "${translateDataBase("بخصائص مصرية", " With Egypt Characteristics ")}"),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                              icon: Icons.circle_sharp,
                              text: "${translateDataBase("طبيعي", "Normal")}",
                              iconColor: AppColor.iconColor1),
                          IconAndTextWidget(
                              icon: Icons.location_on,
                              text: "${translateDataBase(" 1.7 كم", "1.7KM")}",
                              iconColor: AppColor.mainColor),
                          IconAndTextWidget(
                              icon: Icons.access_time_filled_rounded,
                              text: "${translateDataBase("35 دقيقه", "35min")}",
                              iconColor: AppColor.iconColor2)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
