import 'dart:developer';

import 'package:get/get.dart';
import 'package:home_food/core/class/statusrequest.dart';
import 'package:home_food/core/functions/handlingdatacontroller.dart';
import 'package:home_food/core/services/services.dart';
import 'package:home_food/data/datasource/remote/orders/pending_data.dart';
import 'package:home_food/data/model/orders_model.dart';

class OrdersArchiveController extends GetxController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  List<OrdersModel> pendingOrders = [];
  OrdersData pendingData = OrdersData(Get.find());

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "The Order is Beaning Prepared";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getData() async {
    pendingOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    pendingData
        .getArchiveDate(myServices.sharedPreferences.getString("id").toString())
        .then((value) {
      log("$value");
      statusRequest = handlingData(value);
      if (StatusRequest.success == statusRequest) {
        if (value['status'] == "success") {
          List pending = value['data'];
          pendingOrders.addAll(pending.map((e) => OrdersModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    });
    update();
  }

  submitRating(String id, double rating, String comment) {
    statusRequest = StatusRequest.loading;
    update();
    pendingData.addRaring(id, rating.toString(), comment).then((value) {
      log("$value");
      statusRequest = handlingData(value);
      if (StatusRequest.success == statusRequest) {
        if (value['status'] == "success") {
          getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    });
    update();
  }

  refreshOrder() {
    getData();
    update();
  }
}
