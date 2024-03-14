import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
import 'package:helpingheart/Resources/UrlResources.dart';
import 'package:helpingheart/view/authentication/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class change_password extends StatefulWidget {
  const change_password({super.key});

  @override
  State<change_password> createState() => _change_passwordState();
}

class _change_passwordState extends State<change_password> {

  TextEditingController _newpass=TextEditingController();
  TextEditingController _confirmpass=TextEditingController();
  TextEditingController _currentpass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                  //padding: EdgeInsets.fromLTRB(30,100,30,30),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _currentpass,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Current Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _newpass,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'New Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _confirmpass,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                  SizedBox(height: 10,),
                  Container(
                  padding: EdgeInsets.fromLTRB(60, 20, 60, 10),
    child: SizedBox(
    width: double.infinity,
    child:ElevatedButton(
    onPressed: () async {
      var currentpass = _currentpass.text.toString();
      var newpass = _newpass.text.toString();
      var cpass= _confirmpass.text.toString();

      if(newpass==cpass)
        {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var uid = prefs.getString("userid");
          print(uid);
          Uri url = Uri.parse(UrlResources.Change_Password);
          var param ={"userid":uid,"oldpass":currentpass,"newpass":newpass,};
          var responce = await http.post(url,body:param);
          if (responce.statusCode==200)
          {
            var json = jsonDecode(responce.body.toString());
            if(json["status"]=="Success")
              {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginscreen()));

              }
            else
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(json["message"]),
                  ),
                );

              }
          }
          else
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Invalid URL'),
              ),
            );
          }
        }
      else
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Your new password and confirm password are not matched'),
            ),
          );
          //Your newpassword and confirmpassword are not matched.
        }

      

    },
      style: ElevatedButton.styleFrom(
        //maximumSize: Size(60,20),
        backgroundColor: StyleResources.btncolor, // background color
        foregroundColor: StyleResources.btntext, // text color
        elevation: StyleResources.btnelevation, // button's elevation when it's pressed
      ),
      child: const Text('Done'),
    ) ,
    )
                  ),
          ],
            ),
            ),
        ),
      ),
    );
  }
}
