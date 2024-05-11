import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_food/core/constant/color.dart';

import '../../../controller/orders/orderdetails_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/translatedordatabase.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('${translateDataBase("تفاصيل الطلبات", "Orders Details")}')),
      body: GetBuilder<OrderDetailsViewControllerImp>(
          init: Get.put(OrderDetailsViewControllerImp()),
          builder: (controller) => HandlingDataViewNot(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Card(

                      shadowColor: AppColor.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: Column(
                          children: [
                            Table(
                              children: [
                                 TableRow(children: [
                                  Text(
                                    '${translateDataBase("المنتج", "Product")}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '${translateDataBase("الكمية", "QTY")}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '${translateDataBase("سعر", "Price")}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ]),
                                ...List.generate(
                                    controller.ordersDetails.length,
                                    (index) => TableRow(children: [
                                          Text(
                                            "${controller.ordersDetails[index].itemsName}",
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            "${controller.ordersDetails[index].countitems}",
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "${controller.ordersDetails[index].itemsprice}",
                                            textAlign: TextAlign.center,
                                          ),
                                        ])),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                                "${translateDataBase("الاجمالي", "Total Price")} : ${controller.ordersModel.ordersTotalprice} ${translateDataBase("حنيه مصري", "EG")}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    if (controller.ordersModel.ordersType == "0")
                      Card(
                        color: AppColor.white.withOpacity(0.5),
                        shadowColor: AppColor.primaryColor,
                        child: ListTile(
                          titleTextStyle: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          subtitleTextStyle:
                              const TextStyle(color: AppColor.white),
                          title:  Text('${translateDataBase("عنوان الشحن", "Shipping Address")}'),
                          subtitle: Text(
                              "${controller.ordersModel.addressName}  ${controller.ordersModel.addressStreet}"),
                        ),
                      ),
                    if (controller.ordersModel.ordersType == "0")
                      Expanded(
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GoogleMap(
                              mapType: MapType.normal,
                              markers: controller.markers.toSet(),
                              liteModeEnabled: false,
                              initialCameraPosition: controller
                                      .cameraPosition ??
                                  const CameraPosition(target: LatLng(0, 0)),
                              onMapCreated:
                                  (GoogleMapController controllerMap) {
                                controller.completerController!
                                    .complete(controllerMap);
                              },
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ))),
    );
  }
}
