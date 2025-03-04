import 'package:flutter/material.dart';
import 'package:note_taking_project/custom_component/button.dart';
import 'package:note_taking_project/view/create_account_view.dart';
import 'package:note_taking_project/view/user_login_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/welcome.jpg",
                width: 500.w,
              ),
            ),
            SizedBox(height: 30.h,),
            Center(
              child: Text(
                textAlign: TextAlign.center,
              "Discover Your \n Dream  Job here",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 25.sp,
                  color: Color(0xFF1F41BB),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Explore all the existing job roles based on your \n interest and study major",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),

            
            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    text: "Login",
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: UserLogin()));
                    },
                    backgroundColor: const Color(0xFF1F41BB),
                    textColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: "Register",
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: CreateUserAccount(),
                        ),
                      );
                    },
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                  ),
                ),
              ],
            ),
            
            Spacer(),
          ],
          
        ),
      ),
    );
  }
}
