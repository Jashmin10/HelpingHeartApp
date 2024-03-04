import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helpingheart/view/authentication/loginscreen.dart';

class SpleceScreen extends StatefulWidget {
  const SpleceScreen({super.key});

  @override
  State<SpleceScreen> createState() => _SpleceScreenState();
}

class _SpleceScreenState extends State<SpleceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(microseconds: 600),(time){

    });
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginscreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("images/splash_screen.png"),
      ),

    );
  }
}
