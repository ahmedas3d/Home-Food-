import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_food/core/constant/color.dart';
import '../../core/functions/translatedordatabase.dart';


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

  @override
  Widget build(BuildContext context) {
    return Column(
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
              dayProps: const EasyDayProps(
                todayHighlightStyle: TodayHighlightStyle.withBackground,
                todayHighlightColor: Colors.black,
              ),
            ),
            SizedBox(height: 25,),
            /////الوقت
          ],
        ),

      ],
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
