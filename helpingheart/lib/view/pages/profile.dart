import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
import 'package:helpingheart/view/authentication/change_password.dart';
import 'package:helpingheart/view/authentication/loginscreen.dart';

class profile extends StatefulWidget {
  profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _ProfileState();
}

class _ProfileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'My Profile',
            textAlign: TextAlign.right,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: StyleResources.txtgreen,
                ),
                child: Text(
                  'Setting',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => change_password()), // Replace EditProfilePage with your desired page
                );
              },
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => change_password()), // Replace EditProfilePage with your desired page
                );
                // Handle button 2 tap
              },
            ),
            ListTile(
              title: Text('My cart'),
              onTap: () {
                // Handle button 3 tap
              },
            ),

            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => loginscreen()), // Replace LoginScreen with your login page
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_picture.jpg'),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'User name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Test User',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              'About User',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'User Details. ',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text('Profile'),
      // ),
      // body: Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
      //         ElevatedButton(
      //           onPressed: () {
      //             // Handle button press
      //           },
      //           child: Text('Edit Profile'),
      //         ),
      //         SizedBox(height: 10), // Spacer between buttons
      //         ElevatedButton(
      //           onPressed: () {
      //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => change_password()));
      //           },
      //           child: Text('Change Password'),
      //         ),
      //         SizedBox(height: 10), // Spacer between buttons
      //         ElevatedButton(
      //           onPressed: () {
      //             // Handle button press
      //           },
      //           child: Text('My Cart'),
      //         ),
      //         SizedBox(height: 10), // Spacer between buttons
      //         ElevatedButton(
      //           onPressed: () {
      //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => loginscreen()));
      //           },
      //           child: Text('Logout'),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}