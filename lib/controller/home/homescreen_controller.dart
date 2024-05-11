import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/view/screen/home/home.dart';
import 'package:home_food/view/screen/home/notification_screen.dart';
import 'package:home_food/view/screen/home/offers_screen.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/translatedordatabase.dart';
import '../../core/services/services.dart';
import '../../view/screen/home/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int i = 0;
  MyServices myServices = Get.find();
  int currentIndex = 0;
  late StatusRequest statusRequest;
  List<Widget> listPage = [
    const HomePage(),
    const NotificationScreen(),
    const OffersView(),
    const Settings(),
  ];
  List bottomAppBar = [
    {"title": translateDataBase("الصفحة الرئسية", "Home"), "icon": Icons.home},
    {
      "title": translateDataBase("الاشعارات", "Notifications"),
      "icon": Icons.notifications_active_outlined
    },
    {
      "title": translateDataBase("الشيفات", "Chefs"),
      "icon": Icons.people_outline
    },
    {
      "title": translateDataBase("الاعدادات", "Settings"),
      "icon": Icons.settings
    },
  ];

  @override
  changePage(currentPage) {
    i = currentPage;
    update();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    super.onInit();
  }
}
