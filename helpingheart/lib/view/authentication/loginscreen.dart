import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
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
            height: 550.0,
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
                          prefixIcon: Icon(Icons.add_photo_alternate_outlined),
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
                              prefixIcon: Icon(Icons.add_moderator_outlined),
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
                              GestureDetector(
                                onTap: () {
                                  // Add your logic for the "Remember me" checkbox here
                                },
                                child: Checkbox(
                                  value: false, // Set initial value accordingly
                                  onChanged: (value) {
                                    // Add your logic for the "Remember me" checkbox here
                                  },
                                ),
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(fontSize: 16),
                              ),
                              Spacer(), // Spacer to push the "Forget Password" text to the right edge
                              TextButton(
                                onPressed: () {
                                  // Add functionality here for the forget password action
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
        
                              Uri url = Uri.parse("http://localhost/helping_hearts/HHApi/login.php");
                              var param = {"contact" : username,"pass" : pass};
        
                              var responce = await http.post(url,body: param);
                              if(responce.statusCode==200)
                                {
                                  //success
                                  var json = jsonDecode(responce.body.toString());
                                  print(json["status"]);
        
                                }
                              else
                                {
                                  print("error");
        
                                }
        
        
        
        
                            },
                            style: ElevatedButton.styleFrom(
                              //maximumSize: Size(60,20),
                              primary: StyleResources.btncolor, // background color
                              onPrimary: StyleResources.btntext, // text color
                              elevation: StyleResources.btnelevation, // button's elevation when it's pressed
                            ),
                            child: const Text('Login'),
                          ) ,
                        )
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: RichText(
                        text: TextSpan(
                          children: [
        
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
        
                          WidgetSpan(child:
                          TextButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              child: Text("Sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade900,
                                decoration: TextDecoration.underline,
                              ),)
                          )
                          ),
                          ],
                        ),
        
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
