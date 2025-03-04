import 'package:flutter/material.dart';
import 'package:note_taking_project/custom_component/button.dart';
import 'package:note_taking_project/custom_component/icons.dart';
import 'package:note_taking_project/custom_component/user_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_taking_project/view/user_dashboard_view.dart';
import 'package:page_transition/page_transition.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isButtonEnable = false;
  bool isAutoValidate = false;

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

  // Validate password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: isAutoValidate
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Login here",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F41BB)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "Welcome back you've \n been missed!",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                width: 380.w,
                height: 420.h,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFf1F41BB)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 360,
                      height: 60,
                      child: CustomButton(
                        backgroundColor: Color(0xFF1F41BB),
                        textStyle: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                        text: "Sign in",
                        onPressed: !isButtonEnable
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Account created successfully")),
                                  );
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: UserDashboard()),
                                  );
                                }

                                setState(() {
                                  isAutoValidate = true;
                                });

                    
                              }
                            : null,
                       
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 360.w,
                      height: 60.h,
                      child: CustomButton(
                        text: 'Create new account ',
                        onPressed: () {},
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'or continue with',
                style: TextStyle(
                    color: Color(0xFF1F41BB),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(icon: Icons.g_mobiledata, onPressed: () {}),
                  SizedBox(width: 10.w),
                  CustomIcon(icon: Icons.facebook, onPressed: () {}),
                  SizedBox(width: 10.w),
                  CustomIcon(icon: Icons.apple, onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
