import 'package:e_commerce_app/screens/auth_ui/signin_screen.dart';
import 'package:e_commerce_app/utils/app_const.dart';
import 'package:e_commerce_app/widgets/login_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome_Screen extends StatefulWidget {
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  State<Welcome_Screen> createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.appMainColor,

        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 350,
            width: double.infinity,
            color: AppConst.appMainColor,
            child: Center(child: Text('Welcome to E_Commerce App',style: TextStyle(
              color: AppConst.textColor,fontWeight: FontWeight.bold,fontSize: 25,
            ),)
            ),
          ),
          SizedBox(height: 20,),
          Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text('Happy Shopping',style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,
              ),)),

          SizedBox(height: 40,),
          Container(

            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Login_Widget(
              hasIcon: true,
              icon: Icons.g_mobiledata,

                onTap: (){
                Get.to(()=>SignIn_Screen());
                }, title: 'Sign in with Google', ),
          ),

          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Login_Widget(
              hasIcon: true,
              icon: Icons.email,
              onTap: (){}, title: 'Sign in with Email', ),
          ),
        ],
      ),
    );
  }
}
