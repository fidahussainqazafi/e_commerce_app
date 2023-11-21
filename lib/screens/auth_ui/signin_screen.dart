import 'package:e_commerce_app/widgets/textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import '../../utils/app_const.dart';
import '../../widgets/login_btn_widget.dart';
import 'signup_screen.dart';

class SignIn_Screen extends StatefulWidget {
  const SignIn_Screen({Key? key}) : super(key: key);

  @override
  State<SignIn_Screen> createState() => _SignIn_ScreenState();
}

class _SignIn_ScreenState extends State<SignIn_Screen> {

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible){
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Sign in ',style: TextStyle(color: Colors.white),),
              backgroundColor: AppConst.appSecondColor,
            ),
            body: Column(
              children: [
                //  isKeyboardVisible ? SizedBox.shrink():
                Container(
                  height: 250,
                  width: double.infinity,
                  color: AppConst.appSecondColor,
                  child: Center(child: Text('Welcome to E_Commerce App',style: TextStyle(
                    color: AppConst.textColor,fontWeight: FontWeight.bold,fontSize: 25,
                  ),)
                  ),
                ),
                SizedBox(height: 70,),

                TxtFormWidget(

                    hintxt: 'Email',
                    icn: Icon(Icons.email),
                    keyboardtype: TextInputType.emailAddress),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TxtFormWidget(
                        suffixIcon: Icon(Icons.visibility),
                        hintxt: 'Password',

                        icn: Icon(Icons.password),


                        keyboardtype: TextInputType.visiblePassword),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){
                      //  Get.to(()=>Forget_Password());
                    }, child: Text('Forget password?',
                      style: TextStyle(
                          color: AppConst.appMainColor,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),)
                ),
                SizedBox(height: 10,),
                Container(

                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Login_Widget(
                    onTap: (){
                      Get.to(()=>SignIn_Screen());
                    },
                    title: 'Sign in ', ),
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Text('Dont have an account?'),
                    TextButton(onPressed: (){
                      Get.offAll(()=>SignUp_Screen());
                    }, child: Text('Register',
                      style: TextStyle(color: AppConst.appMainColor,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),)
                  ],
                ),

              ],
            ),
          );
        }
    );
  }
}
