import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_food/data/datasource/remote/orders/pending_data.dart';
import 'package:home_food/data/model/orders_model.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';

abstract class OrderDetailsViewController extends GetxController {
  getDataCart();
}

class OrderDetailsViewControllerImp extends OrderDetailsViewController {
  MyServices myServices = Get.find();
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<OrdersDetailsModel> ordersDetails = [];
  late OrdersModel ordersModel;

  Completer<GoogleMapController>? completerController;
  List<Marker> markers = [];
  CameraPosition? cameraPosition;
  double? lat;
  double? long;
  late String orderId;

  late StatusRequest statusRequest;

  initData() {
    completerController = Completer<GoogleMapController>();
    cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat ?? "0"),
            double.parse(ordersModel.addressLong ?? "0")),
        zoom: 12.4746);
    markers.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(double.parse(ordersModel.addressLat ?? "0"),
            double.parse(ordersModel.addressLong ?? "0"))));
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersModel'];
    orderId = ordersModel.ordersId!;
    initData();
    getDataCart();
    super.onInit();
  }

  @override
  Future getDataCart() async {
    ordersDetails.clear();
    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData.getDate(orderId.toString());
    log("========================================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List details = response['data'];
        ordersDetails
            .addAll(details.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    log("==============================================================================${ordersDetails.length}");
    update();
  }
}
