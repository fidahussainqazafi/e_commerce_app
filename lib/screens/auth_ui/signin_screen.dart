import 'package:e_commerce_app/controller/signin_controller.dart';
import 'package:e_commerce_app/controller/signup_controller.dart';
import 'package:e_commerce_app/screens/auth_ui/forget_password_screen.dart';
import 'package:e_commerce_app/screens/user_panel/main_screen.dart';
import 'package:e_commerce_app/widgets/textform_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final SignupController signupController = Get.put(SignupController());
  final SignInController signInController = Get.put(SignInController());
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx(() => TxtFormWidget(
                          controller: passwordcontroller,
                          hasIcon: true,
                          obscureText: signupController.isPasswordVisible.value,
                          suffixIcon: Icon(Icons.visibility),
                          hintxt: 'Password',
                          icn: Icon(Icons.password),
                          keyboardtype: TextInputType.visiblePassword),)
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){
                        Get.to(()=>Forget_Password_Screen());
                      }, child: Text('Forget password?',
                        style: TextStyle(
                            color: AppConst.appMainColor,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),)
                  ),
                  SizedBox(height: 10,),
                  Container(

                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Login_Widget(
                      onTap: () async{
                        String email = emailcontroller.text.trim();
                        String password = passwordcontroller.text.trim();
                        if(email.isEmpty || password.isEmpty){

                          Get.snackbar('Error', 'Please enter all details',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConst.appSecondColor,
                            colorText: AppConst.textColor,
                          );
                        } else {

                          UserCredential? userCredential = await signInController.signInMethod(
                              email,
                              password);
                          if(userCredential != null){
                            if(userCredential.user!.emailVerified){
                              Get.snackbar('Success', 'Login Success',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConst.appSecondColor,
                                colorText: AppConst.textColor,

                              );
                              Get.to((Main_Screen()));

                            }else {
                              Get.snackbar('Error', 'Please verify your email before login',
                              snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConst.appSecondColor,
                                  colorText: AppConst.textColor,
                              );

                            }
                          } else {
                            Get.snackbar('Error', 'Please try again',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConst.appSecondColor,
                              colorText: AppConst.textColor,
                            );

                          }
                        }

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
            ),
          );
        }
    );
  }
}
