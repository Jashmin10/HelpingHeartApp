import 'dart:math';

import 'package:flutter/material.dart';

class my_donation extends StatefulWidget {
  const my_donation({super.key});

  @override
  State<my_donation> createState() => _my_donationState();
}

class _my_donationState extends State<my_donation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [Expanded(
                    child: Container(
                      child: Image.network(
                        'assets/images/donation1.jpg',
                        width: 100, // adjust width as needed
                        height: 150, // adjust height as needed
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Text('User Name',
                        style: TextStyle(fontSize: 20),),
                        Text('Date & Time',
                          style: TextStyle(fontSize: 20),),
                        Text('Donation Name',
                          style: TextStyle(fontSize: 20),),
                        Text('Description',
                          style: TextStyle(fontSize: 20),)],
                      ),
                    ),
                  )],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [Expanded(
                        child: Container(
                          child: Image.network(
                            'assets/images/food.jpg',
                            width: 100, // adjust width as needed
                            height: 150, // adjust height as needed
                          ),
                        ),
                      ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text('User Name',
                                style: TextStyle(fontSize: 20),),
                                Text('Date & Time',
                                  style: TextStyle(fontSize: 20),),
                                Text('Donation Name',
                                  style: TextStyle(fontSize: 20),),
                                Text('Description',
                                  style: TextStyle(fontSize: 20),)],
                            ),
                          ),
                        )],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [Expanded(
                        child: Container(
                          child: Image.network(
                            'assets/images/food.jpg',
                            width: 100, // adjust width as needed
                            height: 150, // adjust height as needed
                          ),
                        ),
                      ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text('User Name',
                                style: TextStyle(fontSize: 20),),
                                Text('Date & Time',
                                  style: TextStyle(fontSize: 20),),
                                Text('Donation Name',
                                  style: TextStyle(fontSize: 20),),
                                Text('Description',
                                  style: TextStyle(fontSize: 20),)],
                            ),
                          ),
                        )],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [Expanded(
                        child: Container(
                          child: Image.network(
                            'assets/images/food.jpg',
                            width: 100, // adjust width as needed
                            height: 150, // adjust height as needed
                          ),
                        ),
                      ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text('User Name',
                                style: TextStyle(fontSize: 20),),
                                Text('Date & Time',
                                  style: TextStyle(fontSize: 20),),
                                Text('Donation Name',
                                  style: TextStyle(fontSize: 20),),
                                Text('Description',
                                  style: TextStyle(fontSize: 20),)],
                            ),
                          ),
                        )],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [Expanded(
                        child: Container(
                          child: Image.network(
                            'assets/images/food.jpg',
                            width: 100, // adjust width as needed
                            height: 150, // adjust height as needed
                          ),
                        ),
                      ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text('User Name',
                                style: TextStyle(fontSize: 20),),
                                Text('Date & Time',
                                  style: TextStyle(fontSize: 20),),
                                Text('Donation Name',
                                  style: TextStyle(fontSize: 20),),
                                Text('Description',
                                  style: TextStyle(fontSize: 20),)],
                            ),
                          ),
                        )],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [Expanded(
                        child: Container(
                          child: Image.network(
                            'assets/images/food.jpg',
                            width: 100, // adjust width as needed
                            height: 150, // adjust height as needed
                          ),
                        ),
                      ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text('User Name',
                                style: TextStyle(fontSize: 20),),
                                Text('Date & Time',
                                  style: TextStyle(fontSize: 20),),
                                Text('Donation Name',
                                  style: TextStyle(fontSize: 20),),
                                Text('Description',
                                  style: TextStyle(fontSize: 20),)],
                            ),
                          ),
                        )],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
