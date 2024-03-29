
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
import 'package:helpingheart/Resources/UrlResources.dart';
import 'package:helpingheart/view/authentication/forgetpassword.dart';
import 'package:helpingheart/view/authentication/registration.dart';
import 'package:helpingheart/view/pages/Dashboard.dart';
import 'package:helpingheart/view/pages/food_donation.dart';
import 'package:helpingheart/view/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  TextEditingController _unm = TextEditingController();
  TextEditingController _upass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      backgroundColor: Colors.green.shade800, // Set Scaffold background color to red
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: 700,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(
                      MediaQuery.of(context).size.width, 120.0)),
            ),
            child: Center(
             // child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade900,
                        ),
                      ),
                    ),
                    Text(
                      'Login to your account',
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
                        controller: _unm,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.add_call),
                          hintText: 'Contact number',
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
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            controller: _upass,
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
                          SizedBox(height: 10), // Spacer for separation
                          Row(
                            children: [
                              Spacer(), // Spacer to push the "Forget Password" text to the right edge
                              TextButton(
                                onPressed: () {
                                  // Add functionality here for the forget password action
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>forgetpassword()));
                                },
                                style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                                ),
                                child: Text(
                                  'Forget Password ?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade900,
                                    // Change the color to your preference
                                  ),
                                ),
                              ),
                            ],
                          ),
        
                        ],
                      ),
                    ),
        //GreenButton(),
        
                    Container(
                        padding: EdgeInsets.fromLTRB(60, 20, 60, 10),
                        child: SizedBox(
                          width: double.infinity,
                          child:ElevatedButton(
                            onPressed: () async {
                                    var username = _unm.text.toString();
                                    var pass = _upass.text.toString();

                                    Uri url = Uri.parse(UrlResources.Login_URL);
                                    var param = {"contact":username,"password":pass};
                                    var responce = await http.post(url,body: param,);
                                   // print(responce.statusCode);
                                    if(responce.statusCode==200)
                                    {

                                      var json = jsonDecode(responce.body.toString());

                                      if(json["status"]=="Success")
                                        {
                                          var unm = json["mydata"]["name"];
                                          var uid = json["mydata"]["user_id"];
                                          var uemail = json["mydata"]["email"];
                                          var ucontact = json["mydata"]["contact"];
                                            SharedPreferences pref = await SharedPreferences.getInstance();
                                            pref.setString("isLogin", "yes");
                                          pref.setString("username", unm);
                                          pref.setString("userid", uid);
                                          pref.setString("useremail", uemail);
                                          pref.setString("userphone", ucontact);

                                         var id = pref.getString("username");
                                         print(id);

                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard()));
                                        }
                                      else
                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Invalid User.'),
                                          ),
                                        );

                                      }


                                    }
                                    else
                                    {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Invalid Access.'),
                                        ),
                                      );

                                    }
                            },
                            style: ElevatedButton.styleFrom(
                              //maximumSize: Size(60,20),
                              backgroundColor: StyleResources.btncolor, // background color
                              foregroundColor: StyleResources.btntext, // text color
                              elevation: StyleResources.btnelevation, // button's elevation when it's pressed
                            ),
                            child: const Text('Login'),
                          ) ,
                        )
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => registration()));
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade900,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                    // Add your TextField, Checkbox, "Forget Password?" Row, and ElevatedButton here
                  ],
                ),
              ),
        
            ),
        
          ),
      ),

    );
  }
}
