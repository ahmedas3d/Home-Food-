import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/color.dart';
import 'package:intl/intl.dart';
import '../../core/functions/translatedordatabase.dart';
import '../../data/model/all_models.dart';


class OrderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${translateDataBase("تفاصيل الطلب", "Order Details")}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OrderDetailsForm(),
      ),
    );
  }
}

class OrderDetailsForm extends StatefulWidget {
  @override
  _OrderDetailsFormState createState() => _OrderDetailsFormState();
}

class _OrderDetailsFormState extends State<OrderDetailsForm> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController timeHour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${translateDataBase("كتابة تفاصيل الطلب:", "Write Order Details:")}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              TextField(
                controller: _textController,
                maxLines: null,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: AppColor.gray),
                  hintText: "${translateDataBase("أدخل تفاصيل الطلب هنا...", "Enter order details here...")}",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 25,),
              Text(
                "${translateDataBase("حدد التاريخ والوقت", "Select the date and time")}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8,),
              EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  //`selectedDate` the new date selected.
                },
                activeColor: AppColor.primaryColor,
              ),
              SizedBox(height: 25,),
              CustomFormAuth(
                color: Colors.black12,
                hinttext: '${translateDataBase("ادخل الوقت", "Entry Time")}',
                label: '${translateDataBase("أدخل الوقت", "Entry Time")}',
                iconData: Icons.access_time_filled,
                mycontroller: timeHour,
                valid: (val) {
                  if (val!.isEmpty) {
                    return  "${translateDataBase("ليس التاريخ", "Not Date")}";
                  }
                  return null;
                },
                onTapFull: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData(
                          useMaterial3: true,
                          primaryColor: Colors.white,
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedTime != null) {
                    DateTime parsedTime = DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        pickedTime.hour,
                        pickedTime.minute);
                    String formattedTime = DateFormat.jm().format(parsedTime);
                    timeHour.text = formattedTime;
                  } else {
                    print("Time is not selected");
                  }
                },
                isNamber: false,
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                onPressed:() {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Animation - 1715517181037.gif",
                            height: 190,
                            width: 600,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${translateDataBase("يتم مراجعة طلبك", "𝙔𝙤𝙪𝙧 𝙧𝙚𝙦𝙪𝙚𝙨𝙩 𝙞𝙨 𝙗𝙚𝙞𝙣𝙜 𝙧𝙚𝙫𝙞𝙚𝙬𝙚𝙙")}",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: AppColor.primaryColor,
                                padding: const EdgeInsets.only(
                                    right: 120, left: 120) // foreground
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "${translateDataBase("تم", "𝘿𝙤𝙣𝙚")}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
