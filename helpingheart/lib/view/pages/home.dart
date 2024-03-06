import 'package:flutter/material.dart';
import 'package:helpingheart/view/authentication/change_password.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>change_password()));

                },
                child: Text("Change Password"),
              ),

            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 35,
                child: Text('Recent Donation',
                  style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.network(
                            'images/donation1.jpg', // Use AssetImage for images included in the app
                            width: 150, // Set width of the image
                            height: 180, // Set height of the image
                          ),
                          Text("Food Donatio")
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                        children: [
                          Image.network(
                            'images/donation1.jpg',// Use AssetImage for images included in the app
                            width: 150, // Set width of the image
                            height: 180, // Set height of the image
                          ),
                          Text("Book Donation")
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                        children: [
                          Image.network(
                            'https://example.com/images/donation1.jpg', // Use AssetImage for images included in the app
                            width: 150, // Set width of the image
                            height: 180, // Set height of the image
                          ),
                          Text("Cloths Donation")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 35,
                child: Text('Choose your donation',
                  style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(200), // Half of the width or height to create a circular shape
                            child: Image(
                              image: AssetImage('images/donation2.jpg'), // Use AssetImage for images included in the app
                              width: 80, // Set width of the image
                              height: 80, // Set height of the image
                            ),
                          ),
                          Text("Food")
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100), // Half of the width or height to create a circular shape
                            child: Image(
                              image: AssetImage('images/donation2.jpg'), // Use AssetImage for images included in the app
                              width: 80, // Set width of the image
                              height: 80, // Set height of the image
                            ),
                          ),
                          Text("Cloths")
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100), // Half of the width or height to create a circular shape
                            child: Image(
                              image: AssetImage('images/donation2.jpg'), // Use AssetImage for images included in the app
                              width: 80, // Set width of the image
                              height: 80, // Set height of the image
                            ),
                          ),
                          Text("Book")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 25,

              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Article",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("See all",style: TextStyle(fontSize: 15,color: Colors.greenAccent),)],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    height: 190,
                    width: 150,
                    child: Column(
                      children: [Image(
                        image: AssetImage('images/development.webp'), // Use AssetImage for images included in the app
                        width: 150, // Set width of the image
                        height: 150, // Set height of the image
                      ),
                        Text("this is first article for food donation")
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 190,
                    width: 150,
                    child: Column(
                      children: [Image(
                        image: AssetImage('images/development.webp'), // Use AssetImage for images included in the app
                        width: 150, // Set width of the image
                        height: 150, // Set height of the image
                      ),
                        Text("this is second article for food donation")
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 190,
                    width: 150,
                    child: Column(
                      children: [Image(
                        image: AssetImage('images/development.webp'), // Use AssetImage for images included in the app
                        width: 150, // Set width of the image
                        height: 150, // Set height of the image
                      ),
                        Text("this is third article for food donation")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
