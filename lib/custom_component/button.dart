import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback ? onPressed;
  final  Color ? backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
   // Unique Hero tag

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    // Hero tag required
    this.backgroundColor,
    this.textColor = Colors.white,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          // padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 14),
          textStyle: textStyle ?? 
               TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
