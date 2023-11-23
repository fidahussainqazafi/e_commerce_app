import 'dart:async';
import 'package:e_commerce_app/controller/get_user_data_controller.dart';
import 'package:e_commerce_app/screens/admin_panel/admin_main_screen.dart';
import 'package:e_commerce_app/screens/auth_ui/welcome_screen.dart';
import 'package:e_commerce_app/screens/user_panel/main_screen.dart';
import 'package:e_commerce_app/utils/app_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), () {
     loggedin(context);
    });
  }

  Future<void> loggedin(BuildContext context) async{

    if(user != null){
      final GetUserDataController getUserDataController = Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      if(userData[0]['isadmin'] == true){
        Get.offAll((const AdminMainScreen()));
      }else{

        Get.offAll((const Main_Screen()));
      }

    }else{
      Get.to(()=>const Welcome_Screen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.appSecondColor,
      appBar: AppBar(
        backgroundColor: AppConst.appSecondColor,

        elevation: 0,
      ),
      body: const SafeArea(
        child:  Column(
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
