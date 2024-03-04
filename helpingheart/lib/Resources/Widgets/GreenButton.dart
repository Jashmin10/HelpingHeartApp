import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';

class GreenButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
    return                   Container(
        padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
        child: SizedBox(
          width: double.infinity,
          child:ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              //maximumSize: Size(60,20),
              primary: StyleResources.btncolor, // background color
              onPrimary: StyleResources.btntext, // text color
              elevation: StyleResources.btnelevation, // button's elevation when it's pressed
            ),
            child: const Text('Login'),
          ) ,
        )
    );
  }

}