import 'package:auto_route/auto_route.dart';
import 'package:demo_auth/models/user.dart';
import 'package:flutter/material.dart';


@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.user});

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Logged In"),

          Text("UserName : ${user?.userName }"),

          Text("Full Name : ${user?.fullName}")
        ],
      ),
     ),
    );
  }
}