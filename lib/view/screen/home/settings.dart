import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/color.dart';
import 'package:home_food/core/constant/imageassets.dart';
import 'package:home_food/core/localization/changelocal.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/home/settings_controller.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/translatedordatabase.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: AppColor.primaryColor),
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/cover1.jpeg"))),
              ),
              Positioned(
                  top: Get.width / 4,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColor.backgroundColor,
                          backgroundImage:
                          AssetImage(AppImageAssets.imageAvatar),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "${controller.myServices.sharedPreferences.getString("username")}"),
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: Get.width * 0.3,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              color: AppColor.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(
                      "language".tr,
                      style: const TextStyle(color: AppColor.black,fontWeight: FontWeight.w400,fontSize: 18),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            LocaleController controller =
                            Get.put(LocaleController());
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),

                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      translateDataBase(
                                          "تغير اللغة", "Change the language"),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        controller.changeLang("ar");
                                        Get.forceAppUpdate();
                                        Get.appUpdate();
                                        Get.back();
                                      },
                                      textColor: AppColor.black,
                                      color: AppColor.primaryColor,
                                      minWidth: double.infinity,
                                      child: Text(
                                        translateDataBase(
                                            "اللغة العربية", "Arabic"),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        controller.changeLang("en");
                                        Get.forceAppUpdate();
                                        Get.appUpdate();
                                        Get.back();
                                      },
                                      textColor: AppColor.black,
                                      color: AppColor.primaryColor,
                                      minWidth: double.infinity,
                                      child: Text(
                                        translateDataBase(
                                            "اللغة الانجليزية", "English"),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ]),
                            );
                          });
                      // Get.toNamed(AppRoute.language);
                    },
                    trailing: const Icon(
                      Icons.language_rounded,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    title: Text(
                      "orders".tr,
                      style: const TextStyle(color: AppColor.black,fontWeight: FontWeight.w400,fontSize: 18),
                    ),
                    onTap: () {
                      Get.toNamed(AppRoute.ordersPending);
                    },
                    trailing: const Icon(
                      Icons.card_travel,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    title: Text(
                      '${translateDataBase("الارشيف", "Archive")}',
                      style: const TextStyle(color: AppColor.black,fontWeight: FontWeight.w400,fontSize: 18),
                    ),
                    onTap: () {
                      Get.toNamed(AppRoute.ordersArchive);
                    },
                    trailing: const Icon(
                      Icons.archive_outlined,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    title: Text(
                      "address".tr,
                      style: const TextStyle(color: AppColor.black,fontWeight: FontWeight.w400,fontSize: 18),
                    ),
                    onTap: () {
                      Get.toNamed(AppRoute.addressView);
                    },
                    trailing: const Icon(
                      Icons.location_on_outlined,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    tileColor:Colors.transparent,
                    title: Text(
                      "logout".tr,
                      style: const TextStyle(color: AppColor.black,fontWeight: FontWeight.w400,fontSize: 18),
                    ),
                    onTap: () {
                      controller.logout();
                    },
                    trailing: const Icon(
                      Icons.exit_to_app,
                      color: AppColor.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: Get.width * 0.70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMedia(
                    icon: Icons.facebook,
                    text: "Facebook".tr,
                    onPressed: () {
                      facebook();
                    }),
                buildMedia(
                    icon: FontAwesome.whatsapp,
                    text: "Whatsapp".tr,
                    onPressed: () {
                      whatsapp();
                    }),
                buildMedia(
                    icon: FontAwesome.instagram,
                    text: "Instagram".tr,
                    onPressed: () {
                      whatsapp();
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

whatsapp() async {
  const url = "whatsapp://send?phone=+2001014781603";
  await launch(url);
}

facebook() async {
  const url = 'https://www.facebook.com/ahmed.asaad.3434/';
  await launch(url);
}

instagram() async {
  const url = 'https://www.instagram.com/ahmedasaaaaad/';
  await launch(url);
}

webSite() async {
  const url = 'https://www.instagram.com/ahmedasaaaaad/';
  await launch(url);
}


Widget buildMedia(
    {required String text,
      required IconData icon,
      void Function()? onPressed}) {
  const color = AppColor.primaryColor;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        IconButton(
          onPressed: onPressed,
          iconSize: 30,
          icon: Icon(
            icon,
            color: color,
          ),
        ),
        Text(
          text,
          style: const TextStyle(color: AppColor.gray, fontSize: 10),
        ),
      ],
    ),
  );
}
