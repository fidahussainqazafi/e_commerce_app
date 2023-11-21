import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_const.dart';

class TxtFormWidget extends StatelessWidget {
  final double? width;
  final String hintxt;
  final Icon icn;
  final TextInputType keyboardtype;
  final Icon? suffixIcon;

  const TxtFormWidget({
    Key? key,
    required this.hintxt,
    required this.icn,
    required this.keyboardtype,
    this.suffixIcon,
    this.width = 330,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child:TextFormField(
            cursorColor: AppConst.appMainColor,
            keyboardType: keyboardtype,

            decoration: InputDecoration(
              hintText: hintxt,
              prefixIcon: icn,
              suffixIcon: suffixIcon ,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
    ),
      );
  }
}
