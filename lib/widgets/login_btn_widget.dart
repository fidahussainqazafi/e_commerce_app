import 'package:e_commerce_app/utils/app_const.dart';
import 'package:flutter/material.dart';

class Login_Widget extends StatefulWidget {
  final double? width;
  final double? height;
  final String? title;
  final VoidCallback? onTap;
  final bool? hasIcon;
  final IconData? icon;

  const Login_Widget({
    Key? key,
    this.width = double.infinity,
    this.height = 50,
    required this.title,
    this.onTap,
    this.hasIcon = false,
    this.icon,
  }) : super(key: key);

  @override
  State<Login_Widget> createState() => _Login_WidgetState();
}

class _Login_WidgetState extends State<Login_Widget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: AppConst.appMainColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: widget.hasIcon == true
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Icon(widget.icon, color: Colors.white, size: 25),

              SizedBox(
                width: 10,
              ),
              Text(
                widget.title!, // Use widget.title to access the title
                style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
              ),

            ],
          )
              : Text(
            widget.title!, // Use widget.title to access the title
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
