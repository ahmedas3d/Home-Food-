

import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }
  getOffersData() async {
    var response = await crud.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
  search(String search) async {
    var response = await crud.postData(AppLink.search, {
      "search":search.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
  Future getNotificationData(String usersId) async {
    var response = await crud
        .postData(AppLink.notification, {"user_id": usersId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}


class ChefData {
  Crud crud;
  ChefData(this.crud);
  addCategories(String name,String nameAr,String userId, File? file) async {
    var response = await crud.postRequestWithImage(
        AppLink.addCategories,
        {
          "categories_name": name.toString(),
          "categories_name_ar": nameAr.toString(),
          "users_id": userId.toString()
        },
        file!,
        "file");
    return response;
  }
}


