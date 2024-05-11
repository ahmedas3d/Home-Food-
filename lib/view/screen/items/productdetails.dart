import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:home_food/core/class/handlingdataview.dart';
import 'package:home_food/core/constant/routes.dart';
import 'package:home_food/view/widget/productdetails/priceandQ.dart';
import 'package:home_food/view/widget/productdetails/topPageProductDetails.dart';
import '../../../controller/home/productdetalis_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedordatabase.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: AppColor.primaryColor),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 50,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                  overlays: SystemUiOverlay.values);
              Get.toNamed(AppRoute.cart);
            },
            color: AppColor.primaryColor,
            child: Text(
              "goToCart".tr,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: AppColor.backgroundColor),
            ),
          ),
        ),
        body: ListView(children: [
          const TopProductPageDetails(),

          GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => HandlingDataViewNot(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translateDataBase(
                            controller.itemsModel.itemsNameAr.toString(),
                            controller.itemsModel.itemsName.toString()),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: AppColor.primaryColor),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      PriceAndCountItems(
                          itemsDescount:
                              "${controller.itemsModel.itemsDescount}",
                          itemsPriceDiscount:
                              "${controller.itemsModel.itemsPriceDiscount}",
                          onAdd: () {
                            controller.add();
                          },
                          onDelete: () {
                            controller.remove();
                          },
                          count: "${controller.count}",
                          price: "${controller.itemsModel.itemsPrice}"),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        translateDataBase(
                            controller.itemsModel.itemsDescAr.toString(),
                            controller.itemsModel.itemsDesc.toString()),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColor.gray),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  )),
            ),
          )
        ]));
  }
}
