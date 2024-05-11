import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/routes.dart';
import 'package:home_food/data/model/address_model.dart';
import '../../../core/constant/color.dart';
import '../../../core/services/services.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/address_data.dart';

abstract class AddAddressChefController extends GetxController {
  initialData();
}

class AddAddressChefControllerImp extends AddAddressChefController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());

  late TextEditingController addressStreet;
  late TextEditingController addressName;
  late TextEditingController phone;

  List<AddressModel> address = [];

  int? currentIndex;
  var cat;

  late StatusRequest statusRequest;

  String? username;
  String? email;
  String? id;

  var addresss = 'Your Address'.obs;
  double? addressLat;

  double? addressLong;

  Future<void> updateLocation() async {
    statusRequest = StatusRequest.loading;
    update();
    Position position = await _determinePosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    addressLat = position.latitude;
    addressLong = position.longitude;
    addresss.value =
        "${place.subAdministrativeArea},${place.administrativeArea},${place.country}";
    statusRequest = StatusRequest.none;
    update();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    update();

    return await Geolocator.getCurrentPosition();
  }

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    addressStreet = TextEditingController();
    addressName = TextEditingController();
    phone = TextEditingController();
    updateLocation();
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    addressStreet.dispose();
    addressName.dispose();
    phone.dispose();
    super.dispose();
  }

  addAddressData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await addressData.addAddressData(
          id.toString(),
          addressName.text,
          cat.toString(),
          addressStreet.text,
          addressLat.toString(),
          addressLong.toString());
      if (kDebugMode) {
        print(
            "========================================================================$response");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.mySplashScreen);
          Get.rawSnackbar(
              snackPosition: SnackPosition.TOP,
              title: "notice".tr,
              messageText: Text("success".tr),
              backgroundColor: AppColor.primaryColor,
              duration: const Duration(seconds: 1));
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }
}
