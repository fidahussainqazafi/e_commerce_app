import 'package:e_commerce_app/screens/auth_ui/welcome_screen.dart';
import 'package:e_commerce_app/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({Key? key}) : super(key: key);

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.appMainColor,
        title: Text('Welcome to E_Commerce'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async{
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.signOut();
             await Get.offAll(()=>Welcome_Screen());
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
