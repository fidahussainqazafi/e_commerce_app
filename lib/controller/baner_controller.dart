import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerController extends GetxController{

  RxList<String> bannersUrls = RxList<String>([]);


  @override
  void onInit(){
    super.onInit();
    fetchBannersUrls();
  }
  // fetch banners

Future<void> fetchBannersUrls() async {
    try{
        QuerySnapshot bannersSnapshot =await FirebaseFirestore.instance.collection('banners').get();

        if(bannersSnapshot.docs != null){
          bannersUrls.value = bannersSnapshot.docs.map((doc) =>doc['imageUrl'] as String).toList();
        }

    }catch(e){
      print('error $e');
    }
}
}