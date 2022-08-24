import 'package:flutter/material.dart';
import 'package:odc_mobile_app_task/Quiz/quiz/quiz_screen.dart';
import 'package:odc_mobile_app_task/screens/BlogsScreen.dart';
import 'package:odc_mobile_app_task/screens/CreatePost.dart';
import 'package:odc_mobile_app_task/screens/ForgetPassword.dart';
import 'package:odc_mobile_app_task/screens/HomeScreen.dart';
import 'package:odc_mobile_app_task/screens/ListOfPlant.dart';
import 'package:odc_mobile_app_task/screens/LoginScreen.dart';
import 'package:odc_mobile_app_task/screens/MyCartScreen.dart';
import 'package:odc_mobile_app_task/screens/OTpScreen.dart';
import 'package:odc_mobile_app_task/screens/QrCodeScanScreen.dart';
import 'package:odc_mobile_app_task/screens/ResetPassword.dart';
import 'package:odc_mobile_app_task/screens/SignUpScreen.dart';
import 'package:odc_mobile_app_task/screens/SingleBlog.dart';
import 'package:odc_mobile_app_task/screens/SplashScreen.dart';
import 'package:splashscreen/splashscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: "LoginScreen",
      routes: {
        'LoginScreen': (context) => const LoginScreen(),
        'SignupScreen': (context) => const SignupScreen(),
        'listofplant':(context)=> ListOfLavie(),
        'home':(context)=> Home(),
        'scanQr':(context)=>const QrScan(),
        'forgetpassword':(context)=>const ForgetPasswordScreen(),
        'otp':(context)=> OTP(),
        'creatpost':(context)=> CreatePost(),
        "mycart":(context)=>MyCart(),
        "quiz" :(context)=>QuizScreen(),
        "singleblog":(context)=>SingleBlog(),




      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.green, // background (button) color
            onPrimary: Colors.white, // foreground (text) color
          ),
        ),
      ),
      home:SplashPage(),
    );
  }
}
