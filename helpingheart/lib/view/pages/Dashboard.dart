import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
import 'package:helpingheart/view/pages/categorypage.dart';
import 'package:helpingheart/view/pages/donatelist.dart';
import 'package:helpingheart/view/pages/home.dart';
import 'package:helpingheart/view/pages/my_donation.dart';
import 'package:helpingheart/view/pages/my_home.dart';
import 'package:helpingheart/view/pages/profile.dart';
import 'package:helpingheart/view/pages/shopping.dart';
import 'package:helpingheart/view/pages/viewcart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard> {
  var selected=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>viewcart())
            );
          },
          icon: Icon(Icons.add_shopping_cart),
        )
      ],),
      body: Column(
        children: [
          Expanded(
              child:
              (selected == 0) ? home()  : (selected == 1) ? donatelist(): (selected == 2) ? categorypage() : profile()),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10.0),
            color: StyleResources.txtgreen,
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selected=0;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(Icons.home),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("Home")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selected=1;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(Icons.monitor_heart),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("My Donation")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selected=2;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(Icons.add_shopping_cart),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("Shopping")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      selected=3;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(Icons.account_circle_sharp),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("Profile")
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),

    );
  }
}
