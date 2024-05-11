import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/admin/addChif_controller.dart';
import '../../../core/functions/translatedordatabase.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/customtextformauth.dart';


class AddChef extends StatelessWidget {
  const AddChef({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChefControllerImp());
    return Scaffold(
        appBar: AppBar(
          title:  Text(translateDataBase("قم باضافة بيانات", "Add Your Data")),

        ),
        body: GetBuilder<ChefControllerImp>(
            builder: (controller) => Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                            GetBuilder<ChefControllerImp>(
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
                                return validInput(val!, 2, 100, "name");
                              },
                              mycontroller: controller.name,
                              label:
                              "${translateDataBase("اسمك بالانجليزي", "Your name in English")}",
                              hinttext:
                              "${translateDataBase("اسمك بالانجليزي", "Your name in English")}",
                              iconData: Icons.drive_file_rename_outline,
                            ),
                            const SizedBox(height: 16),
                            CustomFormAdd(
                              isNamber: false,
                              valid: (val) {
                                return validInput(val!, 2, 100, "name");
                              },
                              mycontroller: controller.nameAr,
                              label:
                              "${translateDataBase("اسمك بالعربى", "Your name in Arabic")}",
                              hinttext:
                              "${translateDataBase("اسمك بالعربى", "Your name in Arabic")}",
                              iconData: Icons.drive_file_rename_outline,
                            ),
                            // Add more TextFormField widgets for other fields like phone, etc.
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Add your logic to save employee data
                                    controller.addData();
                                  },
                                  child: Text(
                                      '${translateDataBase("اضف بياناتك", "Add your data")}'),
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
                ))));
  }
}

