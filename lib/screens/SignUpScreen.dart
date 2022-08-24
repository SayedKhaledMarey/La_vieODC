import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
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
                            style: TextStyle(fontSize: 14, color: Colors.green),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 45,
                        child: Divider(
                          color: Colors.green,
                          thickness: 3,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 140,
                height: 40,
                child: TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: ('First name')),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              SizedBox(
                width: 140,
                height: 40,
                child: TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: ('Last name')),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(45, 10, 0, 0),
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
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
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
            height: 30,
          ),
          Container(
              height: 60,
              padding: const EdgeInsets.fromLTRB(45, 10, 45, 0),
              child: ElevatedButton(
                child: const Text('Sign Up'),
                onPressed: () {
                  print(
                      '----------------------------------------------------------');
                  signup(
                      firstNameController.text.toString(),
                      lastNameController.text.toString(),
                      gmailController.text.toString(),
                      passwordController.text.toString());
                },
              )),
          const SizedBox(
            height: 30,
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
          SizedBox(
            height: 0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                  height: 70,
                  child: SvgPicture.asset("assets/Svgs/BouttomRightLogin.svg")),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ],
      ),
    );
  }

  Future<void> signup(
      String firstName, String lastName, String email, String password) async {
    try {
      var dio = Dio();
      final response = await dio.post(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/auth/signup',
          data: {
            'firstName': firstName,
            'lastName': lastName,
            'email': email,
            'password': password,
          });
      if (response.statusCode == 200) {
        print('----------------------------------------------');
        print('signup successful');
        print('-----------------------------------------------');
        Navigator.pushNamed(context, 'listofplant');
      } else {
        print('filed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
