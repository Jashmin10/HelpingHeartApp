import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helpingheart/view/authentication/loginscreen.dart';
import 'package:helpingheart/view/pages/Dashboard.dart';
import 'package:helpingheart/view/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpleceScreen extends StatefulWidget {
  const SpleceScreen({super.key});

  @override
  State<SpleceScreen> createState() => _SpleceScreenState();
}

class _SpleceScreenState extends State<SpleceScreen> {
  checklogin()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.containsKey("isLogin"))
      {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard()));

      }
    else
      {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginscreen()));

      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(microseconds: 600),(time){

    });
    Future.delayed(Duration(seconds: 3)).then((value) {
      checklogin();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/splash_screen.png"),
      ),

    );
  }
}
