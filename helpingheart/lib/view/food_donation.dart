import 'package:flutter/material.dart';

import '../Resources/StyleResources.dart';

class food_donation extends StatefulWidget {
  const food_donation({super.key});

  @override
  State<food_donation> createState() => _food_donationState();
}

class _food_donationState extends State<food_donation> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("food donation"),),
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
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.add_photo_alternate_outlined),
              hintText: 'Type of food',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)
                ),
              ),
            ),
            items: [
              DropdownMenuItem(
                child: Text('Veg food'),
                value: 'option1',
              ),
              DropdownMenuItem(
                child: Text('Non Veg food'),
                value: 'option2',
              ),
              DropdownMenuItem(
                child: Text('both veg and non veg'),
                value: 'option3',
              ),
            ],
            onChanged: (value) {
              // Handle dropdown value change here
            },
          ),
        ),
      
        Container(
          padding:EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.add_photo_alternate_outlined),
              hintText: 'Food items',
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
          padding:EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.add_photo_alternate_outlined),
              hintText: 'Quantity',
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
          child: Image(
            image: AssetImage('images/donation2.jpg'), // Replace 'image_name.png' with your image file path
            width: 40, // Set the width of the image
            height: 50, // Set the height of the image
            fit: BoxFit.cover, // Adjust the image size to cover the entire space
          ),
        ),
        Container(
          padding:EdgeInsets.fromLTRB(60, 10, 60, 10),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.add_photo_alternate_outlined),
              hintText: 'Description',
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
            child: SizedBox(
              width: double.infinity,
              child:ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  //maximumSize: Size(60,20),
                  primary: StyleResources.btncolor, // background color
                  onPrimary: StyleResources.btntext, // text color
                  elevation: StyleResources.btnelevation, // button's elevation when it's pressed
                ),
                child: const Text('Procced'),
              ) ,
            )
        ),
        ],
      ),
      ),
      ),
      ),
    ),
    );
  }
}
