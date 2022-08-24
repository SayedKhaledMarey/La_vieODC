import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:odc_mobile_app_task/screens/ResetPassword.dart';
import 'package:otp_screen/otp_screen.dart';

class OTP extends StatelessWidget {
  // This widget is the root of your application.

  //   moveToNextScreen(context) {
  // }

  @override
  Widget build(BuildContext context) {
    String email = "sayedmarey333@gmail.com";
    Future<String?> validateOtp(
      String otp,
    ) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      var dio = Dio();
      final response = await dio.post(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/verify-otp',
          data: {
            'email': email,
            'otp': otp,
          });
      if (response.statusCode == 200 && email == "sayedmarey333@gmail.com") {
        print('--------------------------------------------------------');
        print('go hereeee-------------------------------');
        Navigator.push(context,MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(otp),
        ),);
      } else {
        return "The entered Otp is wrong";
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtpScreen.withGradientBackground(
        topColor: Colors.white,
        bottomColor: Colors.white,
        otpLength: 6,
        validateOtp: validateOtp,
        //  routeCallback: moveToNextScreen,
        themeColor: Colors.green,
        titleColor: Colors.green,
        title: "Email Verification",
        subTitle: "Enter the code sent to \n $email",
        icon: SizedBox(
          height: 60,
          width: 180,
          child: Image.asset(
            'assets/Svgs/laviephoto.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
