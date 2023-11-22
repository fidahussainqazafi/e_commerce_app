import 'package:e_commerce_app/controller/signup_controller.dart';
import 'package:e_commerce_app/screens/auth_ui/signin_screen.dart';
import 'package:e_commerce_app/widgets/textform_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final SignupController signupController = Get.put(SignupController());
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
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
                   TxtFormWidget(
                   controller: usernamecontroller,
                      hintxt: 'Username',
                      icn: Icon(Icons.person),
                      keyboardtype: TextInputType.name),
                   TxtFormWidget(
                     controller: emailcontroller,
                      hintxt: 'Email',
                      icn: Icon(Icons.email),
                      keyboardtype: TextInputType.emailAddress),
                   TxtFormWidget(
                     controller: phonecontroller,
                      hintxt: 'Phone',
                      icn: Icon(Icons.phone),
                      keyboardtype: TextInputType.phone),
                   TxtFormWidget(
                     controller: citycontroller,
                      hintxt: 'City',
                      icn: Icon(Icons.location_on),
                      keyboardtype: TextInputType.name),
                   Obx(() => TxtFormWidget(
                     hasIcon: true,
                       controller: passwordcontroller,
                       suffixIcon: Icon(Icons.visibility_off),
                       obscureText: signupController.isPasswordVisible.value,
                       hintxt: 'password',
                       icn: Icon(Icons.password),
                       keyboardtype: TextInputType.visiblePassword),),


                  SizedBox(height: 50,),
                 Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Login_Widget(


                      onTap: () async{
                        String name = usernamecontroller.text.trim();
                        String email = emailcontroller.text.trim();
                        String phone = phonecontroller.text.trim();
                        String city = citycontroller.text.trim();
                        String password = passwordcontroller.text.trim();
                        String userDeviceToken = '';
                        if(email.isEmpty || name.isEmpty || phone.isEmpty || city.isEmpty || password.isEmpty){
                          Get.snackbar('Error', 'Please enter all details',
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: AppConst.appSecondColor,
                            colorText: AppConst.textColor,
                          );
                        }else {
                          UserCredential ? userCredential = await signupController.signUpMethod(
                              name,
                              email,
                              city,
                              phone,
                              password,
                              userDeviceToken,
                          );

                          if(userCredential != null){
                            Get.snackbar('Verification email sent', 'Please check your email',
                            snackPosition: SnackPosition.TOP,
                                backgroundColor: AppConst.appSecondColor,
                                colorText: AppConst.textColor,
                            );
                                FirebaseAuth.instance.signOut();
                            Get.offAll(()=>SignIn_Screen());

                          }
                        }

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
