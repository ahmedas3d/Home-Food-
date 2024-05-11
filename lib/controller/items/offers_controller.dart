import 'dart:developer';
import 'package:get/get.dart';
import 'package:home_food/controller/home/home_controller.dart';
import 'package:home_food/core/constant/routes.dart';
import 'package:home_food/data/datasource/remote/items_data.dart';
import 'package:home_food/data/model/categories_model.dart';
import 'package:home_food/data/model/itemsmodel.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class OffersControllerImp extends SearchMaxController {
  MyServices myServices = Get.find();

  List<CategoriesModel> itemsOffers = [];
  List categories = [];

  ItemsData itemsData = ItemsData(Get.find());

  String? username;
  String? email;
  String? id;

  goToItems(categories, selectedCat, catId) {
    Get.toNamed(AppRoute.itemsView, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catId": catId,
    });
  }
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    initialData();
    getOfferData();
    // FirebaseMessaging.instance.getToken().then((value) {
    //   if (kDebugMode) {
    //     print(value);
    //   }
    //   String? token = value;
    // });
    super.onInit();
  }

  getOfferData() async {
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getOffersData();

    log("========================================================================$response");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List item = response['data'];
        categories.addAll(response['data']) ;
        itemsOffers.addAll(item.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsModel": itemsModel});
  }
}
