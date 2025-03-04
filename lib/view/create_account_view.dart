import 'package:flutter/material.dart';
import 'package:note_taking_project/custom_component/button.dart';
import 'package:note_taking_project/custom_component/icons.dart';
import 'package:note_taking_project/custom_component/user_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_taking_project/view/user_welcome_screen.dart';
import 'package:page_transition/page_transition.dart';

class CreateUserAccount extends StatefulWidget {
  const CreateUserAccount({super.key});

  @override
  State<CreateUserAccount> createState() => _CreateUserAccountState();
}

class _CreateUserAccountState extends State<CreateUserAccount> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isButtonEnabled = false;
  bool isAutoValidate = false;

  // AutovalidateMode emailAutoValidate = AutovalidateMode.disabled;
  // AutovalidateMode passwordAutoValidate = AutovalidateMode.disabled;
  // AutovalidatenMode confirmPasswordAutoValidate = AutovalidateMode.disabled;

  // Function to validate email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    if (!emailExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Function to validate password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Function to validate confirm password
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Form(
        autovalidateMode: isAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                "Create Account",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F41BB),
                ),
              ),
              SizedBox(height: 10.h,),
              Text(
                textAlign: TextAlign.center,
                "Create an account so you can explore all the \n existing jobs",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 400.w,
                height: 450.h,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: "Email",
                      controller: _emailController,
                      validator: _validateEmail,
                    ),
                    CustomTextField(
                      hintText: "Password",
                      controller: _passwordController,
                      validator: _validatePassword,
                    ),
                    CustomTextField(
                      hintText: "Confirm Password",
                      controller: _confirmPasswordController,
                      validator: _validateConfirmPassword,
                    ),
                    SizedBox(height: 30.h),
                     SizedBox(
                      width: 340.w,
                      height: 60.h,
                      child: CustomButton(
                        backgroundColor: Color(0xFF1F41BB),
                        textStyle: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        text: "Sign up",
                        onPressed: () {
                          setState(() {
                            isAutoValidate = true;  // Enable auto-validation

                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Account created successfully")),
                              );
                              Navigator.push(
                                context,
                                PageTransition(type: PageTransitionType.fade, child: WelcomeScreen()),
                              );
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 300.w,
                      height: 60.h,
                      child: CustomButton(
                        text: 'Already have an account',
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'or continue with',
                style: TextStyle(
                  color: Color(0xFF1F41BB),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(icon: Icons.g_mobiledata, onPressed: () {}),
                  SizedBox(width: 10.w),
                  CustomIcon(icon: Icons.facebook, onPressed: () {}),
                  SizedBox(width: 10.w),
                  CustomIcon(icon: Icons.apple, onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
