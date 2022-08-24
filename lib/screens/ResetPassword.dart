import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc_mobile_app_task/screens/ForgetPassword.dart';
import 'package:odc_mobile_app_task/screens/OTpScreen.dart';
import 'package:odc_mobile_app_task/screens/ResetPassword.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen(String otp ,{Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController passwordController = TextEditingController();
  late ResetPasswordScreen resetPasswordScreen =new ResetPasswordScreen("");
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                SvgPicture.asset("assets/Svgs/TopLeftLogin.svg"),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            Container(
              // margin: EdgeInsets.fromLTRB(0,0,0,0),
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Svgs/laviephoto.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 6, 30, 30),
            ),
            const Center(
                child: Text(
              "Reset Your Password Now",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.green, fontSize: 25),
            )),
            const Padding(
              padding: EdgeInsets.fromLTRB(45, 30, 0, 0),
              child: Text("New Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
              child: SizedBox(
                height: 40,
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(70, 20, 70, 0),
                child: ElevatedButton(
                  child: const Text(
                    'RESET',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    resetpassword(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                      otpController.text.toString(),
                    );
                  },
                )),
            const SizedBox(
              height: 114,
            ),
            Row(
              children: <Widget>[
                SvgPicture.asset("assets/Svgs/BouttomRightLogin.svg"),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> resetpassword(String password,String email,String otp) async {
    try {
      var dio = Dio();
      final response = await dio.post(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/reset-password',
          data: {
            'email': "sayedmarey3332gmail.com",
            'otp': "228374",
            'password': password,
          });
      if (response.statusCode == 200) {
        print('----------------------------------------------');
        print('password reset successful');
        print('-----------------------------------------------');
        Navigator.pushNamed(context, 'LoginScreen');
      } else {
        print('filed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
