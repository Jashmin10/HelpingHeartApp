import 'package:flutter/material.dart';
import 'package:helpingheart/view/pages/home.dart';
import 'package:helpingheart/view/pages/my_donation.dart';

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
      appBar: AppBar(title: Text("Dashboard"),),
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            child:(selected==0)?home():(selected==1)?my_donation():(selected==2)?Text("Shopping"):Text("Profile"),
          )),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10.0),
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
                      Text("Home")
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
                      Icon(Icons.shop),
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
                      selected=3;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(Icons.verified_user),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("Home")
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
