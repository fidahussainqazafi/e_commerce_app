import 'package:e_commerce_app/screens/auth_ui/welcome_screen.dart';
import 'package:e_commerce_app/utils/app_const.dart';
import 'package:e_commerce_app/widgets/banner_widget.dart';
import 'package:e_commerce_app/widgets/drawer_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({Key? key}) : super(key: key);

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConst.textColor),
        backgroundColor: AppConst.appMainColor,
        title: Text('Welcome to E_Commerce',style: TextStyle(color: Colors.white),),
        centerTitle: true,

      ),

      drawer: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
        child: Wrap(
            runSpacing: 10,
            children: [
              SizedBox(height: 20,),
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
        child: ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          title: Text('ECommerce',style: TextStyle(color: Colors.white),),
          subtitle: Text('1.0.1',style: TextStyle(color: Colors.white),),
          leading: CircleAvatar(
            radius: 22.0,
            backgroundColor: AppConst.appMainColor,
            child: Text('E',style: TextStyle(color: Colors.white),),
          ),

        ),
      ),
        Divider(
          indent: 10,
          endIndent: 10,
          thickness: 1.5,
          color: Colors.grey,
        ),
           Column(
             children: [
               DrawerWidget(
                 txt: 'home',
                 icn: Icon(Icons.home,color: Colors.white,),
               ),
               SizedBox(height: 20,),

               DrawerWidget(txt: 'Products', icn:Icon(Icons.production_quantity_limits,color: Colors.white,),
               ),
               SizedBox(height: 20,),

               DrawerWidget(
                 txt: 'Orders',
                 icn: Icon(Icons.add_business_outlined,color: Colors.white,),
               ),
               SizedBox(height: 20,),
               DrawerWidget(
                 txt: 'contact',
                 icn: Icon(Icons.help,color: Colors.white,),
               ),
               SizedBox(height: 20,),
               GestureDetector(
                 onTap: () async{
                   GoogleSignIn googleSignIn = GoogleSignIn();
                   FirebaseAuth _auth = FirebaseAuth.instance;
                   _auth.signOut();
                   googleSignIn.signOut();
                   await Get.offAll(()=>Welcome_Screen());
                 },
                 child: DrawerWidget(
                   txt: 'Logout',
                   icn: Icon(Icons.logout,color: Colors.white,),
                 ),
               ),

             ],
           )

    ],

        ),
        backgroundColor: AppConst.appSecondColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              BannerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
