import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/controller/items/offers_controller.dart';
import 'package:home_food/core/class/handlingdataview.dart';
import 'package:home_food/view/widget/offers/custom_offer.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../widget/home/customappbar.dart';
import 'home.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersControllerImp());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text('${translateDataBase("الشيفات", "Chefs")}'),
      ),
      body: GetBuilder<OffersControllerImp>(
          builder: (controller) => Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // CustomAppBar(
                    //   onPressedIconFavorite: () {
                    //     Get.toNamed(AppRoute.myFavorite);
                    //   },
                    //   titleAppBar:"${translateDataBase("ابحث عن الشيف", "Find Chef")}".tr,
                    //   onPressedSearch: () {
                    //     controller.onSearchItems();
                    //   },
                    //   onChanged: (val) {
                    //     controller.checkSearch(val);
                    //   },
                    //   myController: controller.search!,
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: !controller.isSearch == true
                            ? ListView.separated(
                                padding: const EdgeInsets.all(2),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.itemsOffers.length,
                                itemBuilder: (context, index) =>
                                    CustomListItemsOffers(
                                  categories: controller.categories,
                                  categoriesModel:
                                      controller.itemsOffers[index],
                                  i: index,
                                ),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                  height: 3,
                                ),
                              )
                            : ListItemsSearch(
                                listData: controller.listDataControl))
                  ],
                ),
              )),
    );
  }
}
