import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/routes.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/homedata.dart';
import '../../data/model/itemsmodel.dart';

abstract class HomeController extends SearchMaxController {
  initialData();
  getData();
  goToItems(categories, int selectedCat, String catId);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  List categories = [];
  List items = [];
  List itemsTopSelling = [];
  List banner = [];
  int? currentIndex;

  @override
  HomeData homeData = HomeData(Get.find());

  String? username;
  String? email;
  String? id;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getData();
    // FirebaseMessaging.instance.getToken().then((value) {
    //   if (kDebugMode) {
    //     print(value);
    //   }
    //   String? token = value;
    // });
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
        itemsTopSelling.addAll(response['itemstopselling']);
        banner.addAll(response['banner']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, catId) {
    Get.toNamed(AppRoute.itemsView, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catId": catId,
    });
  }

  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails, arguments: {"itemsModel": itemsModel});
  }
}

class SearchMaxController extends GetxController {
  List<ItemsModel> listDataControl = [];
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  TextEditingController? search;

  bool isSearch = false;

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    listDataControl.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.search(search!.text);
    if (kDebugMode) {
      print(
          "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List res = response['data'];
        listDataControl.addAll(res.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();

    super.onInit();
  }
}
