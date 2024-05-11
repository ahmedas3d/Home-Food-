import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/class/handlingdataview.dart';
import 'package:home_food/data/model/itemsmodel.dart';
import 'package:home_food/likeapi.dart';
import 'package:home_food/view/screen/items/customlistitems.dart';
import '../../../controller/items/favorite_controller.dart';
import '../../../controller/items/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/home/listitems.dart';
import '../book_screen.dart';
import 'home.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Stack(
                    children: [
                       SizedBox(
                        height: 350.0,
                        width:Get.width,
                      ),
                      SizedBox(
                        height: 200.0,
                        width: Get.width,
                        child: Image.asset(
                          fit: BoxFit.cover,
                          "assets/images/cover1.jpeg",
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Get.back();
                            },
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120.0,
                        left: 15.0,
                        right: 15.0,
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(7.0),
                          child: Container(
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 75.0,
                        left: (MediaQuery.of(context).size.width / 2 - 50.0),
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  "${AppLink.imageCategories}/${controller.categories.categoriesImage!}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 180.0,
                        left: (MediaQuery.of(context).size.width / 2) - 75.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(text: '${translateDataBase(controller.categories.categoriesNameAr, controller.categories.categoriesName)}'),
                            Text(
                                '${translateDataBase(controller.categories.governorateNameAr, controller.categories.governorateNameEn)}'),
                            Text(
                              controller.categories.addressStreet.toString(),
                              style: const TextStyle(color: Colors.grey,fontSize: 12,height: 1),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return const Icon(
                                      Icons.star,
                                      color: AppColor.mainColor,
                                      size: 25,
                                    );
                                  }),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SmallText(text: '4.5'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
          ElevatedButton(
            onPressed: () => Get.to(OrderDetailsScreen()),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryColor),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(right: 100,left: 100)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            child: Text(
              "${translateDataBase("حجز طلبية", "Book order")}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: '${translateDataBase("الاعمال", "Works")}'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GetBuilder<ItemsControllerImp>(
                  builder: (controller) => HandlingDataViewNot(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.items.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                controllerFav.isFavorite[controller.items[index]
                                        ['items_id']] =
                                    controller.items[index]['favorite'];
                                return CustomListItems(
                                    active: false,
                                    itemsModel: ItemsModel.fromJson(
                                        controller.items[index]));
                              })
                          : ListItemsSearch(
                              listData: controller.listDataControl)),
                ),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: GetBuilder<ItemsControllerImp>(
        builder: (controller) => Visibility(
          visible: controller.myServices.sharedPreferences.getString("admin") == "2" && controller.categories.usersId == controller.myServices.sharedPreferences.getString("id"),
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Form(
                              key: controller.formState,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  // Padding(
                                  //   padding: const EdgeInsets.all(16.0),
                                  //   child: Text(
                                  //     '${translateDataBase("إضافة موظف", "Add Employee")}',
                                  //     style: TextStyle(
                                  //       fontSize: 20,
                                  //       fontWeight: FontWeight.bold,
                                  //     ),
                                  //   ),
                                  // ),
                                  GetBuilder<ItemsControllerImp>(
                                    builder: (controller) => InkWell(
                                      onTap: () {
                                        controller.imgGlr();
                                        controller.update();
                                      },
                                      child: Container(
                                        clipBehavior:
                                        Clip.antiAliasWithSaveLayer,
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                        width: 150,
                                        height: 150,
                                        child: Center(
                                          child: controller.myFile == null
                                              ? const Icon(
                                              Icons.add_a_photo_outlined)
                                              : Image.file(
                                            controller.myFile!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  CustomFormAdd(
                                    isNamber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 3, 1000, "name");
                                    },
                                    mycontroller: controller.name,
                                    label:
                                    "${translateDataBase("الاسم بالانجليزى", "Name in English")}",
                                    hinttext:
                                    "${translateDataBase("الاسم بالانجليزى", "Name in English")}",
                                    iconData: Icons.drive_file_rename_outline,
                                  ),
                                  // Add more TextFormField widgets for other fields like phone, etc.
                                  const SizedBox(height: 8),
                                  CustomFormAdd(
                                    isNamber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 3, 1000, "name");
                                    },
                                    mycontroller: controller.nameAr,
                                    label:
                                    "${translateDataBase("الاسم بالعربي", "Name in Arabic")}",
                                    hinttext:
                                    "${translateDataBase("الاسم بالعربي", "Name in Arabic")}",
                                    iconData: Icons.drive_file_rename_outline,
                                  ),
                                  const SizedBox(height: 8),
                                  CustomFormAdd(
                                    isNamber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 3, 10000, "Desc");
                                    },
                                    mycontroller: controller.itemsDesc,
                                    label:
                                    "${translateDataBase("الوصف بالانجليزى", "Description in English")}",
                                    hinttext:
                                    "${translateDataBase("الوصف بالانجليزى", "Description in English")}",
                                    iconData: Icons.drive_file_rename_outline,
                                  ),
                                  const SizedBox(height: 8),
                                  CustomFormAdd(
                                    isNamber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 3, 10000, "Desc");
                                    },
                                    mycontroller: controller.itemsDescAr,
                                    label:
                                    "${translateDataBase("الوصف بالعربي", "Description in Arabic")}",
                                    hinttext:
                                    "${translateDataBase("الوصف بالعربي", "Description in Arabic")}",
                                    iconData: Icons.drive_file_rename_outline,
                                  ),
                                  // Add more TextFormField widgets for other fields like phone, etc.
                                  const SizedBox(height: 8),
                                  CustomFormAdd(
                                    isNamber: true,
                                    valid: (val) {
                                      return validInput(
                                          val!, 1, 10000, "count");
                                    },
                                    mycontroller: controller.itemsDescount,
                                    label:
                                    "${translateDataBase("نسبة الخصم", "discount percentage")}",
                                    hinttext:
                                    "${translateDataBase("نسبة الخصم", "discount percentage")}",
                                    iconData: Icons.numbers,
                                  ),
                                  const SizedBox(height: 8),
                                  CustomFormAdd(
                                    isNamber: true,
                                    valid: (val) {
                                      return validInput(
                                          val!, 1, 10000, "itemsPrice");
                                    },
                                    mycontroller: controller.itemsPrice,
                                    label:
                                    "${translateDataBase("السعر", "Price")}",
                                    hinttext:
                                    "${translateDataBase("السعر", "Price")}",
                                    iconData: Icons.price_check,
                                  ),
                                  // Add more TextFormField widgets for other fields like phone, etc.
                                  GetBuilder<ItemsControllerImp>(
                                    builder: (controller) => ListTile(
                                        title: Text(
                                            "${translateDataBase("اظهار للجميع", "Show to everyone")}"),
                                        trailing: Switch(
                                          value: controller.itemsActive,
                                          onChanged: (value) {
                                            controller.toggleActive();
                                          },
                                        )),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          // Add your logic to save employee data
                                          controller.addData();
                                        },
                                        child: Text(
                                            '${translateDataBase("اضافة", "Add")}'),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Add your logic to save employee data
                                          Get.back();
                                        },
                                        child: Text(
                                            '${translateDataBase("الغاء", "Cancel")}'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),

    );
  }
}
