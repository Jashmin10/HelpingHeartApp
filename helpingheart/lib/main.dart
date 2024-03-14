import 'package:flutter/material.dart';
import 'package:helpingheart/view/authentication/change_password.dart';
import 'package:helpingheart/view/authentication/loginscreen.dart';
import 'package:helpingheart/view/authentication/registration.dart';
import 'package:helpingheart/view/pages/Dashboard.dart';
import 'package:helpingheart/view/pages/SpleceScreen.dart';
import 'package:helpingheart/view/pages/categorypage.dart';
import 'package:helpingheart/view/pages/donation_form.dart';
import 'package:helpingheart/view/pages/home.dart';
import 'package:helpingheart/view/pages/order.dart';

import 'package:helpingheart/view/pages/profile.dart';
import 'package:helpingheart/view/pages/sub_category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Helping Hearts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
        //donation_form(),
        //sub_category(),
        //home(),
        //change_password(),
        SpleceScreen(),
      //loginscreen(),
      //Dashboard(),
      //profile(),
      //registration(),
    );
  }
}


