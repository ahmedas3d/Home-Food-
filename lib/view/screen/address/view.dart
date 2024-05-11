import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/color.dart';
import 'package:home_food/core/constant/routes.dart';
import 'package:home_food/data/model/address_model.dart';
import '../../../controller/home/address/address_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/translatedordatabase.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("address".tr),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            Get.toNamed(AppRoute.addressAdd);
          },
          child: const Icon(Icons.add,color: AppColor.white,),
        ),
        body: GetBuilder<AddressControllerImp>(
            builder: (controller) => HandlingDataViewAddress(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: ListItemsAddress(listData: controller.address),
                  ),
                )));
  }
}

class ListItemsAddress extends GetView<AddressControllerImp> {
  final List<AddressModel> listData;

  const ListItemsAddress({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: Card(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        translateDataBase(
                                            "اسم عنوانك : ", "Address Name : "),
                                        style: const TextStyle(
                                            color: AppColor.black),
                                      ),
                                      Text(
                                        listData[index].addressName.toString(),
                                        style: const TextStyle(
                                            color: AppColor.black),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        translateDataBase(
                                            "المحافظة : ", "City : "),
                                        style: const TextStyle(
                                            color: AppColor.black),
                                      ),
                                      Text(
                                          translateDataBase(
                                              listData[index]
                                                  .governorateNameAr
                                                  .toString(),
                                              listData[index]
                                                  .governorateNameEn
                                                  .toString()),
                                          style: const TextStyle(
                                              color: AppColor.black))
                                    ],
                                  ),
                                  Wrap(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                translateDataBase(
                                                    "الشارع : ", "Street : "),
                                                style: const TextStyle(
                                                    color: AppColor.black,
                                                    fontSize: 12),
                                              )),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                listData[index]
                                                    .addressStreet
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: AppColor.black,
                                                    fontSize: 12),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: AppColor.primaryColor,
                                  ),
                                  Text(translateDataBase(
                                      " موقعك رقم ${index + 1}",
                                      "Location No ${index + 1}")),
                                ],
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: InkWell(
                          onTap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(translateDataBase(
                                    'تأكيد الحذف', "Delete Confirmation")),
                                content: Text(translateDataBase(
                                    'هل تريد الحذف', "Do you want to delete")),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: Text(
                                        translateDataBase('الغاء', 'Cancel')),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      controller.deleteAddressData(
                                          listData[index].addressId.toString());
                                      Get.back();
                                    },
                                    child:
                                        Text(translateDataBase('موافق', 'OK')),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            color: AppColor.gray.withOpacity(0.2),
                            // alignment: Alignment.center,
                            child: const Icon(
                              Icons.delete,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
