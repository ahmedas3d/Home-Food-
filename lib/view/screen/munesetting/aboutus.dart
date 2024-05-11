import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageassets.dart';
import '../../../core/functions/translatedordatabase.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("about".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Image.asset(
                AppImageAssets.onBoardingImageKodixaLogo,
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                child: Text(
                  translateDataBase(
                      "شركة Kodixa للبرمجيات و التسويق العالمية هى شركة متخصصة فى جميع انظمة التكنولوجيا !",
                      "Kodixa Software and Global Marketing is a company specialized in all technology systems!"),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 13, color: AppColor.gray.withOpacity(0.8)),
                )),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Kodixa | ©2023")],
            ),
          ],
        ),
      ),
    );
  }
}
