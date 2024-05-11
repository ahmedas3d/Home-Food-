import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/controller/home/home_controller.dart';
import 'package:home_food/data/model/itemsmodel.dart';
import '../../../core/constant/color.dart';
import '../../../core/dimensions.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../likeapi.dart';

class ItemsView extends GetView<HomeControllerImp> {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: controller.items.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) => ListItemsView(
          itemsModel: ItemsModel.fromJson(controller.items[index]))),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 5,
      ),
    );
  }
}

class ItemsViewTopSelling extends GetView<HomeControllerImp> {
  const ItemsViewTopSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.itemsTopSelling.length,
      itemBuilder: ((context, index) => ListItemsView(
          itemsModel:
          ItemsModel.fromJson(controller.itemsTopSelling[index]))),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        width: 5,
      ),
    );
  }
}

class ListItemsView extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;

  const ListItemsView({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        color: Colors.white,
        child: Row(
          children: [
            //Image Section
            Container(
              width: Dimensions.listViewImgSize,
              height: Dimensions.listViewImgSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20),bottomLeft:Radius.circular(Dimensions.radius20) ),
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          "${AppLink.imageItems}/${itemsModel.itemsImage}"))),
              child: Banner(
                location: BannerLocation.topStart,
                message: "${translateDataBase("عرض اليوم", "Daily offers")}",
                color: AppColor.mainColor,
              ),
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
                              text:
                              "${translateDataBase(" 1.7 كم", "1.7KM")}",
                              iconColor: AppColor.mainColor),
                          IconAndTextWidget(
                              icon: Icons.access_time_filled_rounded,
                              text:
                              "${translateDataBase("35 دقيقه", "35min")}",
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

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText(
      {super.key,
        this.color = const Color(0xFF000000),
        required this.text,
        this.size = 0,
        this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          fontFamily: 'Prompt',
          color: color,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: FontWeight.w400),
    );
  }
}

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText({
    super.key,
    this.color = const Color(0xFFa9a29f),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Prompt',
        color: color,
        fontSize: size,
        height: height,
      ),
    );
  }
}

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconColor;

  const IconAndTextWidget(
      {super.key,
        required this.icon,
        required this.text,
        required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
