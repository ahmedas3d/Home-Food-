import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/color.dart';
import 'package:home_food/core/constant/routes.dart';
import 'package:home_food/data/model/itemsmodel.dart';
import 'package:home_food/view/widget/home/listitems.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/dimensions.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../likeapi.dart';
import '../../widget/home/customappbar.dart';
import '../../widget/home/customtitlehome.dart';
import '../../widget/home/listcategorieshome.dart';
import 'offers_screen.dart';

int? currentIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: GetBuilder<HomeControllerImp>(
            builder: (controller) => Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ListView(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      CustomAppBar(
                        onPressedIconFavorite: () {
                          Get.toNamed(AppRoute.myFavorite);
                        },
                        titleAppBar: "${translateDataBase("ابحث عن طعامك", "Find food")}",
                        onPressedSearch: () {
                          controller.onSearchItems();
                        },
                        onChanged: (val) {
                          controller.checkSearch(val);
                        },
                        myController: controller.search!,
                      ),
                      // const CustomCardHome(
                      //   title: "A Summer Surprise",
                      //   body: "Cashback 20%",
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      !controller.isSearch == true
                          ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CarouselSlider(
                                  items: controller.banner.map((imageUrl) {
                                    return Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10.0)),
                                      child: CachedNetworkImage(
                                          imageUrl:
                                          "${AppLink.imageBanner}/${imageUrl['banner_image']}",
                                          width: double.infinity,
                                          fit: BoxFit.fill),
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                    viewportFraction: 1,
                                    aspectRatio: 2.0,
                                    initialPage: 2,
                                    // height: size.height * 0.25,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval:
                                    const Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index, _) {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    },
                                  )),
                              // This trailing comma makes auto-formatting nicer for build methods.
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: controller.banner.map((url) {
                                  int index = controller.banner
                                      .lastIndexOf(url)
                                      .toInt();
                                  // print(index);
                                  return AnimatedContainer(
                                    duration: const Duration(
                                      milliseconds: 800,
                                    ),
                                    width: currentIndex == index ? 25 : 5,
                                    height: 5,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                      color: currentIndex == index
                                          ? AppColor.primaryColor
                                          : AppColor.gray,
                                    ),
                                  );
                                }).toList(),
                              ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${translateDataBase("الشيفات", "Chefs")}',style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  InkWell(
                                    onTap: () {
                                      Get.to(const OffersView());
                                    },
                                    child:  Text(
                                      '${translateDataBase("عرض المزيد", "see all")}',
                                      style: TextStyle(color: AppColor.primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                              //CustomTitleHome(title: "Chefs".tr),
                              const SizedBox(
                                height: 5,
                              ),
                              const ListCategoriesHome(),
                              if (controller.itemsTopSelling.isNotEmpty)
                                CustomTitleHome(title: "${translateDataBase("عروض اليوم", "Offer Daily")}".tr),
                              if (controller.itemsTopSelling.isNotEmpty)
                                const ItemsViewTopSelling(),
                            ],
                          ))
                          : ListItemsSearch(
                          listData: controller.listDataControl)
                    ]))));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listData;

  const ListItemsSearch({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToProductDetails(listData[index]);
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
                              "${AppLink.imageItems}/${listData[index].itemsImage}"))),
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
                              "${translateDataBase(listData[index].itemsNameAr, listData[index].itemsName)}"),
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
      },
    );
  }
}