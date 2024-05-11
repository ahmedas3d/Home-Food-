import 'package:get/get.dart';
import 'package:home_food/core/services/services.dart';

translateDataBase(ar,en){
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar"){
    return ar;
  }else{
    return en;

  }
}