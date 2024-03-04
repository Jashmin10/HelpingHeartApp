import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      backgroundColor: Colors.red, // Set Scaffold background color to red
      body: Container(
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
            child: Expanded(
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
                  // Add your TextField, Checkbox, "Forget Password?" Row, and ElevatedButton here
                ],
              ),
            ),

          ),
        ),
      ),

    //     child: Column(
    //       children: [
    //         Expanded(
    //
    //           child: Container(
    //             //padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
    //             margin: EdgeInsets.all(20),
    //             decoration:  BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.vertical(
    //                   top: Radius.elliptical(
    //                       MediaQuery.of(context).size.width, 120.0)),
    //             ),
    //             child: Column(
    //               children: [
    //                 Container(
    //
    //
    //                   child: Container(
    //                     padding: EdgeInsets.all(20),
    //                     child: Text(
    //                       'Welcome Back',
    //                       style: TextStyle(
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.green.shade900,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Container(
    //                   child: Text('Login to your account',
    //                     style: TextStyle(fontSize: 15,
    //                     color:Colors.grey.shade500),
    //                   ),
    //                 )
    //               ],
    //
    //             ),
    //           ),
    //         ),
    //         Container(
    //           padding:EdgeInsets.fromLTRB(60, 20, 60, 10),
    //           child: TextField(
    //             decoration: InputDecoration(
    //               prefixIcon: Icon(Icons.add_photo_alternate_outlined),
    //               hintText: 'User Name',
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(12),
    //                     bottomRight: Radius.circular(12)
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Container(
    //           padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               TextField(
    //                 obscureText: true,
    //                 decoration: InputDecoration(
    //                   prefixIcon: Icon(Icons.add_moderator_outlined),
    //                   hintText: 'Password',
    //                   border: OutlineInputBorder(
    //                     borderSide: BorderSide(color: Colors.green),
    //                     borderRadius: BorderRadius.only(
    //                       topLeft: Radius.circular(12),
    //                       bottomRight: Radius.circular(12),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: 10), // Spacer for separation
    //               Row(
    //                 children: [
    //                   Checkbox(
    //                     value: false, // Set initial value accordingly
    //                     onChanged: (value) {
    //                       // Add your logic for the "Remember me" checkbox here
    //                     },
    //                   ),
    //                   Text(
    //                     'Remember me',
    //                     style: TextStyle(fontSize: 16),
    //                   ),
    //                   Spacer(), // Spacer to push the "Forget Password" text to the right edge
    //                   TextButton(
    //                     onPressed: () {
    //                       // Add functionality here for the forget password action
    //                     },
    //                     child: Text(
    //                       'Forget Password ?',
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.green.shade900, // Change the color to your preference
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //
    //             ],
    //           ),
    //         ),
    //
    //
    //         Container(
    //           padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
    // child: SizedBox(
    // width: double.infinity,
    //           child:ElevatedButton(
    //             onPressed: () {},
    //             style: ElevatedButton.styleFrom(
    //               //maximumSize: Size(60,20),
    //               primary: Colors.green.shade900, // background color
    //               onPrimary: Colors.white, // text color
    //               elevation: 5, // button's elevation when it's pressed
    //             ),
    //             child: const Text('Login'),
    //           ) ,
    //         )
    //         ),
    //         Container(
    //           padding: EdgeInsets.fromLTRB(40, 10, 40, 90),
    //           child: RichText(
    //             text: TextSpan(
    //               children: [
    //                 TextSpan(
    //                   text: "Don't have an account? ",
    //                   style: TextStyle(
    //                     color: Colors.grey,
    //                     fontSize: 16,
    //                   ),
    //                 ),
    //                 TextSpan(
    //                   text: "Sign up",
    //                   style: TextStyle(
    //                     color: Colors.green.shade900,
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.bold,
    //                     decoration: TextDecoration.underline,
    //
    //                   ),
    //                   // recognizer: TapGestureRecognizer()
    //                   //   ..onTap = () {
    //                   //     // Add your navigation logic or action for Sign up here
    //                   //   },
    //                 ),
    //
    //               ],
    //             ),
    //
    //           ),
    //         )
    //       ],
    //     ),
   //),

    );
  }
}
