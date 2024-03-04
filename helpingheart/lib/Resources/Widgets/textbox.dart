import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textbox extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      padding:EdgeInsets.fromLTRB(60, 20, 60, 10),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.add_photo_alternate_outlined),
          hintText: 'User Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)
            ),
          ),
        ),
      ),
    );
  }

}