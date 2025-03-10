
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_taking_project/view/user_welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393,852),
      minTextAdapt: true,
      builder: (context, child){
          return MaterialApp(
          title: 'Job Search App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            
            scaffoldBackgroundColor: Colors.white,
          ),
          
          home: WelcomeScreen(),
        );
      },
    );
  }
}


