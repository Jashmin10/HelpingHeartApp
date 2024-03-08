import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
import 'package:helpingheart/view/authentication/loginscreen.dart';


import 'package:http/http.dart' as http;

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  TextEditingController _mail=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
          //child: Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 300
















                  , 0, 0),
            //padding: EdgeInsets.fromLTRB(60, 20, 60, 10),
            child: Text(
              'Forget Password ?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
          ),
              Container(
                padding:EdgeInsets.fromLTRB(60, 20, 60, 10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _mail,
                  decoration: InputDecoration(
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
                     padding: EdgeInsets.fromLTRB(60, 20, 60, 10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              var usermail = _mail.text.toString();
                              
                              Uri url = Uri.parse("http://192.168.1.32/helping_hearts/HHapi/forget_password.php");
                              var param={"email":usermail};
                              var response= await http.post(url, body: param);
                              if(response.statusCode==200){

                                var json = jsonDecode(response.body.toString());
                                if(json["status"]=="Success"){
                                  // var umail = json["mydata"]["email"];
                                  // var uid=json["mydata"]["user_id"];
                                 // var pass
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginscreen()));
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(content: Text("Valid Email"),
                                  //   ),
                                 // );
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Invalid Email"),
                                      ),
                                      );
                                }
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Invalid Access"),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                             backgroundColor: StyleResources.btncolor, // background color
                              foregroundColor: StyleResources.btntext, // text color
                              elevation: StyleResources.btnelevation, // button's elevation when it's pressed
                            ),
                            child: const Text('Send E-mail'),
                          ),
                        ),
                      ],
                    ),
                  )
            ],
          ),
        ),
      ),
    //),
      //),
    );
  }
}
