import 'package:flutter/material.dart';
import 'package:home_food/core/functions/translatedordatabase.dart';
import 'package:get/get.dart';
import 'package:home_food/view/screen/home/offers_screen.dart';

class GovernoratesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> governorates = [
    {
      'name': '${translateDataBase("الاسماعيلية", "Ismailia")}',
      'icon': Icons.location_city,
      'onTap': () => Get.to(CitiesScreen())
    },
    {
      'name': '${translateDataBase("القاهرة", "Cairo")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("اسكندرية", "Alexandria")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("الجيزة", "Giza")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("الاقصر", "Luxor")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("اسوان", "Aswan")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("قنا", "Qena")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("سوهاج", "Sohag")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("اسيوط", "Assiut")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("منيا", "Minya")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("بني سويف", "Beni Suef")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("الفيوم", "Faiyum")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("الغربية", "Gharbia")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("كفر الشيخ", "Kafr El Sheikh")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("المنوفية", "Monufia")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("البحيرة", "Beheira")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("السويس", "Suez")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("بورسعيد", "Port Said")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("دمياط", "Damietta")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("الشرقية", "Sharqia")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("القليوبية", "Qalyubia")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("الدقهلية", "Dakahlia")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("مطروح", "Matruh")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("الوادي الجديد", "New Valley")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("شمال سيناء", "North Sinai")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("جنوب سيناء", "South Sinai")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${translateDataBase("حدد المحافظة ", "Select the governorate")}'),
        toolbarHeight: 80,
      ),
      body: ListView.builder(
        itemCount: governorates.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Card(
              elevation: 1,
              child: ListTile(
                leading: Icon(governorates[index]['icon'], color: Colors.red),
                title: Text(governorates[index]['name']),
                onTap: governorates[index]['onTap'],
              ),
            ),
          );
        },
      ),
    );
  }
}

//=============================city==============================//
class CitiesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cities = [
    {
      'name': '${translateDataBase("الإسماعيلية", "Ismailia")}',
      'icon': Icons.location_city,
      'onTap': () => Get.to(OffersView())
    },
    {
      'name': '${translateDataBase("القنطرة", "El Qantara")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("التل الكبير", "El Tal El Kabir")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("أبو صوير", "Abu Suwayr")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("فايد", "Fayed")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("القصاصين", "El Kassasin")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    },
    {
      'name': '${translateDataBase("الشيخ زايد", "El Sheikh Zayed")}',
      'icon': Icons.location_city,
      'onTap': () => print("ontap")
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${translateDataBase("حدد المدينة", "Select the city")}'),
        toolbarHeight: 80,
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Card(
              elevation: 1,
              child: ListTile(
                leading: Icon(cities[index]['icon'], color: Colors.red),
                title: Text(cities[index]['name']),
                onTap: cities[index]['onTap'],
              ),
            ),
          );
        },
      ),
    );
  }
}
