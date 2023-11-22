
import 'package:e_commerce_app/screens/auth_ui/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../utils/app_const.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;


  Future<void> ForgetPasswordMethod(
      String userEmail,

      ) async {
    try {
      EasyLoading.show(status: 'Please wait');
        await auth.sendPasswordResetEmail(
        email: userEmail,
        );

      Get.snackbar('Request sent successfully', "Password reset link sent to $userEmail",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppConst.appSecondColor,
        colorText: AppConst.textColor,);

      Get.to(()=>SignIn_Screen());

      EasyLoading.dismiss();

    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error', "$e",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppConst.appSecondColor,
        colorText: AppConst.textColor,);
    }
  }
}

