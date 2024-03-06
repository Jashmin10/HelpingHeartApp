import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';



class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
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
          padding: EdgeInsets.fromLTRB(60, 20, 60, 10),
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
          ),
          Container(
            padding:EdgeInsets.fromLTRB(60, 20, 60, 10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_link),
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
                  obscureText: true,
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
                    Checkbox(
                      value: false, // Set initial value accordingly
                      onChanged: (value) {
                        // Add your logic for the "Remember me" checkbox here
                      },
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

                Container(
                 // padding: EdgeInsets.fromLTRB(60, 20, 60, 10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
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
                )

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
