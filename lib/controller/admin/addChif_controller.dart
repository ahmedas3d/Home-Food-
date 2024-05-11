import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/routes.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constant/color.dart';
import '../../core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/homedata.dart';

abstract class ChefController extends GetxController {
  initialData();
}

class ChefControllerImp extends ChefController {
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  ChefData chefData = ChefData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController nameAr = TextEditingController();

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
    initialData();
    super.onInit();
  }

  File? myFile;

  imgGlr() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    debugPrint('path: ${image?.path}');

    if (image != null) {
      File? img = File(image.path);
      img = await cropped(imageFile: img);
      myFile = img;
      update();
    } else {
      log("No Image Selected");
    }
    update();
  }

  Future<File?> cropped({required File imageFile}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      cropStyle: CropStyle.rectangle,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Home Food',
            toolbarColor: AppColor.primaryColor,
            toolbarWidgetColor: AppColor.backgroundColor,
            initAspectRatio: CropAspectRatioPreset.ratio16x9,
            activeControlsWidgetColor: AppColor.backgroundColor,
            backgroundColor: AppColor.primaryColor,
            statusBarColor: AppColor.primaryColor,
            showCropGrid: true,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    return File(croppedFile!.path);
  }

  Future addData() async {
    if (formState.currentState?.validate() == true) {
      statusRequest = StatusRequest.loading;
      var response = await chefData.addCategories(
          name.text, nameAr.text, id.toString(), myFile);
      log("========================================================================$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.forceAppUpdate();
          Get.appUpdate();
          Get.toNamed(AppRoute.addressChefAdd);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }

  goToHome() {
    Get.toNamed(AppRoute.addressChefAdd);
  }
}
