import 'dart:async';
import 'package:flutter/material.dart';
import 'package:odc_mobile_app_task/screens/LoginScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Container(
          // margin: EdgeInsets.fromLTRB(0,0,0,0),
          // height: 50,
          // width: 50,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Svgs/laviephoto.png"),
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}