import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

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
  TextEditingController gmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 6, 30, 30),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(45, 10, 0, 0),
            child: Text("Email"),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: gmailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              height: 60,
              padding: const EdgeInsets.fromLTRB(70, 20, 70, 0),
              child: ElevatedButton(
                child: const Text('Send Code'),
                onPressed: () {
                  forgetPassword(
                    gmailController.text.toString(),
                  );
                },
              )),
          const SizedBox(
            height: 135,
          ),
          Row(
            children: <Widget>[
              SvgPicture.asset("assets/Svgs/BouttomRightLogin.svg"),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ],
      ),
    );
  }

  Future<void> forgetPassword(String email) async {
    try {
      var dio = Dio();
      final response = await dio.post(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/forget-password',
          data: {
            'email': email,
          });
      if (response.statusCode == 200) {
        print('----------------------------------------------');
        print('code sent successful');
        print('-----------------------------------------------');
        Navigator.pushNamed(context, 'otp');
      } else {
        print('filed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
