import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/controller/device_token_controller.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/screens/user_panel/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';



//Declares a class named GoogleSignInController that extends GetxController.
// This class will be used to manage the Google Sign-In functionality.
 class GoogleSignInController extends GetxController{

//Creates an instance of GoogleSignIn. This object is used to interact with the Google Sign-In functionality.
   final GoogleSignIn googleSignIn = GoogleSignIn();
   final FirebaseAuth _auth = FirebaseAuth.instance;


   //signInWithGoogle. This method will be responsible for initiating the Google Sign-In process.
   Future<void> signInWithGoogle() async{
     final GetDeviceTokenController getDeviceTokenController = Get.put(GetDeviceTokenController());

     try{

//Initiates the Google Sign-In process, and the returned GoogleSignInAccount is stored in the variable googleSignInAccount
       final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();


      if(googleSignInAccount != null){
        EasyLoading.show(status: 'please wait');

 // Retrieves the authentication details (accessToken, idToken, etc.) from the googleSignInAccount
        final GoogleSignInAuthentication googleSignInAuthentication =await googleSignInAccount.authentication;

 //Creates an AuthCredential using the GoogleAuthProvider.credential factory constructor. This credential is required to sign in with Firebase using Google credentials.
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        final User ? user = userCredential.user;

        if(user !=  null){
           UserModel userModel = UserModel(
               uId: user.uid,
               username: user.displayName.toString(),
               email: user.email.toString(),
               phoneNumber: user.phoneNumber.toString(),
               userImg: user.photoURL.toString(),
               userdeviceToken: getDeviceTokenController.deviceToken.toString(),
               country: '',
               useradress: '',
               isadmin: false,
               isActive: true,
               createOn: DateTime.now());
           
         await  FirebaseFirestore.instance.collection('users').doc(user.uid).set(userModel.toMap());
         EasyLoading.dismiss();
         Get.offAll(()=>const Main_Screen());
        }

      }


//Catches and handles any exceptions that might occur during the Google Sign-In process.
     }catch (e) {
       EasyLoading.dismiss();

       print('error $e');
     }

   }

 }