import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/UrlResources.dart';
import 'package:http/http.dart' as http;

class article extends StatefulWidget {
  const article({super.key});

  @override
  State<article> createState() => _articleState();
}

class _articleState extends State<article> {
  Future<List?>? alldata;
  var imgurl = UrlResources.articleimg;
  Future<List?>?getdata()async{
    Uri url = Uri.parse(UrlResources.articleimg);
    var response = await http.post(url);
    if(response.statusCode==200)
      {
        var json = jsonDecode(response.body.toString());
        return json['data'];
      }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      alldata = getdata();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
