import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/baner_controller.dart';

class BannerWidget extends StatelessWidget {
   BannerWidget({Key? key}) : super(key: key);
  final CarouselController carouselController = Get.put(CarouselController());
  final BannerController _bannerController = Get.put(BannerController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        return CarouselSlider(
            items: _bannerController.bannersUrls.map((imagesUrl) =>ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(imageUrl: imagesUrl,fit: BoxFit.cover,width: Get.width-10,
            placeholder: (context,url)=>ColoredBox(color: Colors.white,child: Center(
              child: CupertinoActivityIndicator(),
            ),),

              errorWidget: (context,url,error) => Icon(Icons.error),
            ),

            ),

            ).toList(),
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              aspectRatio: 2.5,
              viewportFraction: 1,
            ));
      }),
    );
  }
}
