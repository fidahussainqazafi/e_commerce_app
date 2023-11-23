import 'package:e_commerce_app/controller/forget_password_controller.dart';
import 'package:e_commerce_app/widgets/textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import '../../utils/app_const.dart';
import '../../widgets/login_btn_widget.dart';


class Forget_Password_Screen extends StatefulWidget {
  const Forget_Password_Screen({Key? key}) : super(key: key);

  @override
  State<Forget_Password_Screen> createState() => _Forget_Password_ScreenState();
}

class _Forget_Password_ScreenState extends State<Forget_Password_Screen> {
  final ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());

  final TextEditingController emailcontroller = TextEditingController();


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
            body: SingleChildScrollView(
              child: Column(
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
                      controller: emailcontroller,

                      hintxt: 'Email',
                      icn: Icon(Icons.email),
                      keyboardtype: TextInputType.emailAddress),


                  SizedBox(height: 80,),
                  Container(

                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Login_Widget(
                      onTap: () async{
                        String email = emailcontroller.text.trim();

                        if(email.isEmpty ){

                          Get.snackbar('Error', 'Please enter all details',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConst.appSecondColor,
                            colorText: AppConst.textColor,
                          );
                        } else {
                          String email = emailcontroller.text.trim();
                          forgetPasswordController.ForgetPasswordMethod(email);
                        }


                      },
                      title: 'Forget', ),
                  ),

                  SizedBox(height: 20,),

                ],
              ),
            ),
          );
        }
    );
  }
}
