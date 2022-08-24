import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc_mobile_app_task/screens/LoginScreen.dart';
import 'package:odc_mobile_app_task/screens/SignUpScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(
                    height: 120,
                    width: 120,
                    child: SvgPicture.asset("assets/Svgs/TopLeftLogin.svg")),
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, 'LoginScreen');
                          },
                          child: Container(
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.green),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 45,
                          child: Divider(
                            color: Colors.green,
                            thickness: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, 'SignupScreen');
                          },
                          child: Container(
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 45,
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
              child: Text("Email"),
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
            const Padding(
              padding: EdgeInsets.fromLTRB(45, 10, 0, 0),
              child: Text("Password"),
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
            const SizedBox(
              height: 26,
            ),
            Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(45, 10, 45, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    login(gmailController.text.toString(),
                        passwordController.text.toString());
                  },
                )),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'forgetpassword');
                //----------------------------------forget password screen--------------------------------------------
              },
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  "Forget Password",
                  style: TextStyle(color: Colors.green),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
              child: Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 20,
                      )),
                ),
                const Text("or continue with"),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 20,
                      )),
                ),
              ]),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                SvgPicture.asset("assets/Svgs/Google.svg"),
                const SizedBox(
                  width: 30,
                ),
                SvgPicture.asset("assets/Svgs/Facebook.svg"),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                    height: 80,
                    child:
                        SvgPicture.asset("assets/Svgs/BouttomRightLogin.svg")),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login(String email, String password) async {
    try {
      var dio = Dio();
      final response = await dio.post(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/signin',
          data: {
            'email': email,
            'password': password,
          });
      if (response.statusCode == 200) {
        print('----------------------------------------------');
        print('login successful');
        print('-----------------------------------------------');
        Navigator.pushNamed(context, 'home');
      } else {
        print('filed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
