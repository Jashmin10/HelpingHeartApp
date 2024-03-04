import 'package:flutter/material.dart';
import 'package:helpingheart/view/authentication/forgetpassword.dart';
import 'package:helpingheart/view/authentication/login.dart';
import 'package:helpingheart/view/authentication/loginscreen.dart';
import 'package:helpingheart/view/authentication/registration.dart';
import 'package:helpingheart/view/food_donation.dart';
import 'package:helpingheart/view/pages/SpleceScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: forgetpassword(),
    );
  }
}

