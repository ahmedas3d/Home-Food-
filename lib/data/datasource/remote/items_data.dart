import 'dart:io';

import 'package:get/get.dart';
import 'package:home_food/core/services/services.dart';

import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class ItemsData {
  Crud crud;
  MyServices myServices = Get.find();
  ItemsData(this.crud);
  postData(String idPro) async {
    var response = await crud.postData(AppLink.items, {
      "items_cat": idPro,
      "user_id": myServices.sharedPreferences.getString("id"),
    });
    return response.fold((l) => l, (r) => r);
  }

  addProduct(
      String name,
      String nameAr,
      String itemsDesc,
      String itemsDescAr,
      String itemsActive,
      String itemsDescount,
      String itemsPrice,
      String itemsCat,
      File? file,
      ) async {
    var response = await crud.postRequestWithImage(
        AppLink.addProduct,
        {
          "items_name": name.toString(),
          "items_name_ar": nameAr.toString(),
          "items_desc": itemsDesc.toString(),
          "items_desc_ar": itemsDescAr.toString(),
          "items_active": itemsActive.toString(),
          "items_descount": itemsDescount.toString(),
          "items_price": itemsPrice.toString(),
          "items_cat": itemsCat.toString(),
        },
        file!,
        "file");
    return response;
  }

  getOffersData() async {
    var response = await crud.postData(AppLink.categories, {

    });
    return response.fold((l) => l, (r) => r);
  }
}
