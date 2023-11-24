import 'package:e_commerce_app/utils/app_const.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String heading;
  final String subtitle;
  final VoidCallback ontap;
  final String buttonText;

  const HeadingWidget({Key? key, required this.heading, required this.subtitle, required this.ontap, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      child: Padding(padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(heading,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade800),),
              SizedBox(height: 5,),
              Text(subtitle,style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.grey),),

            ],
          ),
          GestureDetector(
            onTap: ontap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppConst.appSecondColor,
                  width: 1.5,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(buttonText,style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: AppConst.appSecondColor),),
              ),
            ),
          )
        ],
      ),),
    );
  }
}
