import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controller/signup_controller.dart';
import '../utils/app_const.dart';

class TxtFormWidget extends StatelessWidget {
  final double? width;
  final String hintxt;
  final Icon icn;
  final TextInputType keyboardtype;
  final Icon? suffixIcon;
  final TextEditingController controller;
  final bool? obscureText;
  final bool? hasIcon;

  const TxtFormWidget({
    Key? key,
    required this.hintxt,
    required this.icn,
    required this.keyboardtype,
    this.suffixIcon,
    this.width = 330,
    required this.controller,
    this.obscureText = false,
    this.hasIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.put(SignupController());

    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText!,
          cursorColor: AppConst.appMainColor,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
            hintText: hintxt,
            prefixIcon: icn,
            suffixIcon: hasIcon!
                ? GestureDetector(
              onTap: () {
                signupController.isPasswordVisible.toggle();
              },
              child: signupController.isPasswordVisible.value
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            )
                : null, // Set suffixIcon to null if hasIcon is false
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
