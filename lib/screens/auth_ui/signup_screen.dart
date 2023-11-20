import 'package:e_commerce_app/screens/auth_ui/signin_screen.dart';
import 'package:e_commerce_app/widgets/textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import '../../utils/app_const.dart';
import '../../widgets/login_btn_widget.dart';

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({Key? key}) : super(key: key);

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible){
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('SignUp ',style: TextStyle(color: Colors.white),),
              backgroundColor: AppConst.appSecondColor,
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [

                  const SizedBox(height: 70,),
                const   Text('Welcome to my App ',style: TextStyle(fontSize: 25,color: AppConst.appMainColor,fontWeight: FontWeight.bold),),
                 const  SizedBox(height: 30,),
                 const  TxtFormWidget(
                      hintxt: 'Username',
                      icn: Icon(Icons.person),
                      keyboardtype: TextInputType.name),
                 const  TxtFormWidget(
                      hintxt: 'Email',
                      icn: Icon(Icons.email),
                      keyboardtype: TextInputType.emailAddress),
                  const TxtFormWidget(
                      hintxt: 'Phone',
                      icn: Icon(Icons.phone),
                      keyboardtype: TextInputType.phone),
                const   TxtFormWidget(
                      hintxt: 'City',
                      icn: Icon(Icons.location_on),
                      keyboardtype: TextInputType.name),
                 const  TxtFormWidget(
                      hintxt: 'password',
                      icn: Icon(Icons.password),
                      keyboardtype: TextInputType.visiblePassword),


                  SizedBox(height: 50,),
                 Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Login_Widget(


                      onTap: (){
                        Get.to(()=>SignUp_Screen());
                      }, title: 'Sign Up ', ),
                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                   const   Text('Already have an account?'),
                      TextButton(onPressed: (){
                         Get.offAll(()=>SignIn_Screen());
                      }, child: Text('Sign In',
                        style: TextStyle(color: AppConst.appMainColor,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),)
                    ],
                  ),

                ],
              ),
            ),
          );
        }
    );
  }
}
