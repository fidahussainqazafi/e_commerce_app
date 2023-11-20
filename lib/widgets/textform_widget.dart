import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_const.dart';

class TxtFormWidget extends StatelessWidget {
  final String hintxt;
  final Icon icn;
  final TextInputType keyboardtype;

  const TxtFormWidget({Key? key, required this.hintxt, required this.icn,required this.keyboardtype}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          cursorColor: AppConst.appMainColor,
          keyboardType: keyboardtype,
          decoration: InputDecoration(
              hintText: hintxt,
              prefixIcon: icn,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )

          ),
        ),
      ),
    );
  }
}
