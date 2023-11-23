import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final String txt;
  final Icon icn;
  const DrawerWidget({Key? key, required this.txt, required this.icn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(txt,style: TextStyle(color: Colors.white),),
        leading: icn,
        trailing: Icon(Icons.arrow_forward,color: Colors.white,),

      ),

    );
  }
}
