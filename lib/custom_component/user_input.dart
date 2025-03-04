import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final AutovalidateMode autovalidateMode;

  // Constructor with onChanged and autovalidateMode
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.disabled, // Default mode
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged, // Trigger function on user input
        validator: validator,
        autovalidateMode: autovalidateMode, // Corrected autovalidate mode
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(
              color: Color(0xFF1F41BB),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
      ),
    );
  }
}
