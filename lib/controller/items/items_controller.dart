import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/data/model/categories_model.dart';
import 'package:home_food/data/model/itemsmodel.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';import '../../../core/class/statusrequest.dart';
import '../../data/datasource/remote/items_data.dart';
import '../home/home_controller.dart';

abstract class ItemsController extends SearchMaxController {
  initialData();
  getData();
  changeCat(int val,String catVal);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());

  late StatusRequest statusRequest;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController nameAr = TextEditingController();
  TextEditingController itemsDesc = TextEditingController();
  TextEditingController itemsDescAr = TextEditingController();
  TextEditingController itemsDescount = TextEditingController();
  TextEditingController itemsPrice = TextEditingController();
  List items = [];

  int? selectedCat;
  String? catId;
  String? idUser;
  String? username;
  late CategoriesModel categories;

  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catId = Get.arguments['catId'];
    getData();
  }

  @override
  void onInit() {
    search = TextEditingController();

    initialData();
    super.onInit();
  }

  @override
  getData() async {
    items.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.postData(catId.toString());
    if (kDebugMode) {
      print(
        "========================================================================$response");
    }
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  changeCat( val,catVal) {
    selectedCat =val;
    catId =catVal;
    getData();
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productDetails,arguments: {
      "itemsModel":itemsModel
    });
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

  bool itemsActive = true;
  String itemsActiveNum = "1";

  void toggleActive() {
    itemsActive = !itemsActive;
    update();
    if (itemsActive == true) {
      itemsActiveNum = "1";
    } else {
      itemsActiveNum = "0";
    }
    log(itemsActiveNum);
  }

  Future addData() async {
    if (formState.currentState?.validate() == true) {
      statusRequest = StatusRequest.loading;
      var response = await itemsData.addProduct(
        name.text,
        nameAr.text,
        itemsDesc.text,
        itemsDescAr.text,
        itemsActiveNum.toString(),
        itemsDescount.text,
        itemsPrice.text,
        catId.toString(),
        myFile,
      );
      log("========================================================================$response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          name.clear();
          nameAr.clear();
          itemsDesc.clear();
          itemsDescAr.clear();
          itemsDescount.clear();
          myFile = null;
          getData();
          Get.back();
          Get.forceAppUpdate();
          Get.appUpdate();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }

}
