import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
import 'package:helpingheart/Resources/UrlResources.dart';
import 'package:helpingheart/view/authentication/loginscreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  TextEditingController _nm = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("registration") ,),
       body:  SingleChildScrollView(
       child: Center(
           child: Expanded(
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Container(
             // margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
          padding: EdgeInsets.fromLTRB(60, 30, 60, 10),
          child: Text(
          'Register',
          style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
           color: Colors.green.shade900,
            ),
            ),
            ),
          Text(
            'Create your new account',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade500,
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding:EdgeInsets.fromLTRB(60, 20, 60, 10),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _nm,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_circle_sharp),
                hintText: 'User Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding:EdgeInsets.fromLTRB(60, 20, 60, 10),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                Container(
                 padding: EdgeInsets.fromLTRB(40, 30, 40, 10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            var name = _nm.text.toString();
                            var email = _email.text.toString();
                            var pass = _pass.text.toString();

                            Uri url = Uri.parse(UrlResources.Register_URL);
                            var param = {"name":name,"email":email,"password":pass};
                            var responce = await http.post(url,body: param,);

                            if(responce.statusCode==200)
                              {
                                var json = jsonDecode(responce.body.toString());

                                if(json["status"]=="Success")
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(json["message"]),
                                      ),
                                    );
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginscreen()));
                                  }
                                else
                                  {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(json["message"]),
                                      ),
                                    );
                                  }
                              }

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: StyleResources.btncolor, // background color
                            foregroundColor: StyleResources.btntext, // text color
                            elevation: StyleResources.btnelevation, // button's elevation when it's pressed
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
         ],
       ),
       ),
    ),
    ),
      );
  }
}
