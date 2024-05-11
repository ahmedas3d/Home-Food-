import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/color.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constant/imageassets.dart';
import '../../../core/constant/routes.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
   Timer(const Duration(seconds:2), () async {
     await Get.offAllNamed(AppRoute.homeScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 100, bottom: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    AppImageAssets.onBoardingImageKodixaLogo,
                  )),
              const Spacer(),
              Center(
                child: Lottie.asset(AppImageAssets.loading,
                    width: 150, height: 150),
              ),
              const Spacer(),

              Text(
                "Home Food | ©2023",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.6),
                ),
              ),
              // SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
