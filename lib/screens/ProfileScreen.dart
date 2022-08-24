import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfileScreen();
}

class ProfileScreen extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20,50,20,0),
          child: Center(
            child: Profile(
              imageUrl: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
              name: "sayed khaled",
              website: "sadddddddddddddddddddddd",
              designation: "",
              email: "Saedmarey333@gmail.com",
              phone_number: "01221998768",
            ),
          ),
        ));
  }
}