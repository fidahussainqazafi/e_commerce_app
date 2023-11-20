import 'dart:async';

import 'package:e_commerce_app/screens/auth_ui/welcome_screen.dart';
import 'package:e_commerce_app/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.off(()=>const Welcome_Screen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.appSecondColor,
      appBar: AppBar(
        backgroundColor: AppConst.appSecondColor,

        elevation: 0,
      ),
      body: SafeArea(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Welcome to Ecommerce App',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: AppConst.textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
