import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/color.dart';
import 'package:home_food/core/constant/routes.dart';
import 'package:home_food/core/functions/alertextiapp.dart';
import '../../../controller/home/homescreen_controller.dart';
import '../../widget/home/customButtonAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Icon(
                  Icons.shopping_bag,
                  color: AppColor.backgroundColor,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                color: AppColor.white,
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                padding: const EdgeInsets.all(1),
                child: Row(
                  children: [
                    ...List.generate(controller.listPage.length + 1, (index) {
                      int i = index > 2 ? index - 1 : index;
                      return index == 2
                          ? const Spacer()
                          : CustomButtonAppBar(
                              text: controller.bottomAppBar[i]['title'],
                              onPressed: () {
                                controller.changePage(i);
                              },
                              iconData: controller.bottomAppBar[i]['icon'],
                              isActive: controller.i == i ? true : false,
                            );
                    })
                  ],
                ),
              ),
              body: WillPopScope(
                onWillPop: alertExitApp,
                child: controller.listPage.elementAt(controller.i),
              ),
            ));
  }
}
