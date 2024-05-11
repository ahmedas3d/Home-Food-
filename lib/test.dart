import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_food/core/constant/color.dart';
import 'package:home_food/core/constant/routes.dart';

class SpacePage extends StatefulWidget {
  const SpacePage({super.key});

  @override
   SpacePageState createState() => SpacePageState();
}

class SpacePageState extends State<SpacePage> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/kodi.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.width * 0.05,
            child: AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: Image.asset(
                'assets/images/home_food.png',
                height: 100.0,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.25,
            child: AnimatedContainer(
              onEnd: () {
                Get.offAllNamed(AppRoute.homeScreen);
              },
              duration: const Duration(seconds: 1),
              height: _isVisible ? 50.0 : 0.0,
              width: _isVisible ?  200 : 0.0,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  elevation: 5.0,

                ),
                child: const Text(
                  'START',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
