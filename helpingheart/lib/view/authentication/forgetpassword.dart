import 'package:flutter/material.dart';

import '../../Resources/StyleResources.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
          child: Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            Container(
            padding: EdgeInsets.fromLTRB(60, 20, 60, 10),
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: StyleResources.btncolor, // background color
                              onPrimary: StyleResources.btntext, // text color
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
    ),
      ),
    );
  }
}
