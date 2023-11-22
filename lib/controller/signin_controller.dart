
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../utils/app_const.dart';

class SignInController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;


  Future<UserCredential?> signInMethod(
      String userEmail,
      String userPassword,
      ) async {
    try {
      EasyLoading.show(status: 'Please wait');
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error', "$e",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppConst.appSecondColor,
        colorText: AppConst.textColor,);
    }
    return null;
  }
}
