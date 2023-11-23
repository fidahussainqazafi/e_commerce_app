import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/utils/app_const.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  RxBool _isPasswordVisible = true.obs;

  RxBool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }

  Future<UserCredential ?> signUpMethod(String username,
      String useremail,
      String city,
      String phone,
      String password,
      String userDeviceToken,) async {
    try {
      EasyLoading.show(status: 'Please wait');
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: useremail,
        password: password,
      );

      // send email verification
      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: username,
          email: useremail,
          phoneNumber: phone,
          userImg: '',
          userdeviceToken: userDeviceToken,
          country: '',
          useradress: '',
          isadmin: false,
          isActive: true,
          createOn: DateTime.now());

      // add data in firestore

      _firebaseFirestore.collection('users').doc(userCredential.user!.uid).set(
          userModel.toMap());
      EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error', '$e',

        snackPosition: SnackPosition.TOP,
        backgroundColor: AppConst.appSecondColor,
        colorText: AppConst.textColor,
      );

    }
    return null;
  }


}