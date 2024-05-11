import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:home_food/controller/orders/pending_controller.dart';
import 'package:home_food/core/class/handlingdataview.dart';
import 'package:home_food/core/constant/color.dart';
import 'package:home_food/core/constant/routes.dart';
import 'package:home_food/data/model/orders_model.dart';

import '../../../core/functions/translatedordatabase.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('${translateDataBase("الطلبات", "Orders")}'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersPendingController>(
          builder: (controller) => HandlingDataViewNot(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemBuilder: (BuildContext context, int index) =>
                    CardListOrders(
                  ordersModel: controller.pendingOrders[index],
                ),
                itemCount: controller.pendingOrders.length,
              )),
        ),
      ),
    );
  }
}

class CardListOrders extends GetView<OrdersPendingController> {
  final OrdersModel ordersModel;

  const CardListOrders({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shadowColor: AppColor.black,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${"idorder".tr} : #${ordersModel.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat.yMEd()
                      .format(DateTime.parse(ordersModel.ordersTime!)),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                ),
              ],
            ),
            const Divider(),
            Text(
                "${translateDataBase("نوع الطلب", "Order Type")} : ${ordersModel.ordersType == "0" ? "${translateDataBase("توصيل", "Delivery")}" : "${translateDataBase("يستلم", "Receive")}"}"),
            Text("${translateDataBase("سعر الطلب", "Order Price")} : ${ordersModel.ordersPrice} ${translateDataBase("جنيه مصري", "EG")}"),
            Text("${translateDataBase("سعر تسليم", "Delivery Price")} : ${ordersModel.ordersPricedelivery} ${translateDataBase("جنيه مصري", "EG")}"),
            Text(
                "${translateDataBase("طريقة الدفع او السداد", "Payment Method")} : ${ordersModel.ordersPaymentmethod == "0" ? "${translateDataBase("نقدي", "Cash")}" : "${translateDataBase("بطاقة الدفع", "Payment Card")}"}"),
            Row(
              children: [
                Text("${translateDataBase("حالة الطلب", "Order Status")} : "),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: double.parse(ordersModel.ordersStatus!) == 0
                          ? Colors.cyan
                          : double.parse(ordersModel.ordersStatus!) == 1
                          ? Colors.greenAccent
                          : double.parse(ordersModel.ordersStatus!) == 2
                          ? Colors.grey
                          : double.parse(ordersModel.ordersStatus!) == 3
                          ? AppColor.bg.withOpacity(0.5)
                          : double.parse(ordersModel.ordersStatus!) == 4
                          ? AppColor.green
                          : Colors.red),
                  child: Text(
                    controller.printOrderStatus(ordersModel.ordersStatus!),
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${translateDataBase("الاجمالي", "Total Price")} : ${ordersModel.ordersTotalprice} ${translateDataBase("جنيه مصري", "EG")}",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersDetails,
                        arguments: {"ordersModel": ordersModel});
                  },
                  color: AppColor.primaryColor,
                  textColor: AppColor.backgroundColor,
                  child:  Text("${translateDataBase("تفاصيل الطلب", "Order Details")}"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
