
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
import 'package:helpingheart/Resources/UrlResources.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class productdetails extends StatefulWidget {
  var pid;
  var pname;
  var price;
  var desc;
  var img1;
  var img2;
  var img3;
   productdetails({super.key,this.pid, this.pname,this.price,this.img1,this.img2,this.img3,this.desc});

  @override
  State<productdetails> createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  var imgurl = UrlResources.productimg;
TextEditingController _qty = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details"),centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 80, 0, 50),
              child: CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(imgurl+widget.img1),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(imgurl+widget.img2),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //3rd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(imgurl+widget.img3),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                ],   options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pname,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Price: ${widget.price}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Description:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.desc,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Quantity",
                      style: TextStyle(fontSize: 20),),
                      IconButton(
                        onPressed: () {
                          // Decrease quantity logic
                          setState(() {
                            int currentValue = int.tryParse(_qty.text) ?? 0;
                            if (currentValue > 1) {
                              _qty.text = (currentValue - 1).toString();
                            }
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Container(
                        width: 50,
                        child: TextField(
                          controller: _qty,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Increase quantity logic
                          setState(() {
                            int currentValue = int.tryParse(_qty.text) ?? 0;
                            _qty.text = (currentValue + 1).toString();
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences pref =
                  await SharedPreferences.getInstance();
                  var uid = pref.getString("userid");
                  var qty = _qty.text.toString();
                  Uri url = Uri.parse(UrlResources.Cart_URL);
                  var param = {
                    "product_id": widget.pid,
                    "user_id": uid,
                    "qty": qty
                  };
                  var responce =
                  await http.post(url, body: param,);
                  if (responce.statusCode == 200) {
                    var json = jsonDecode(responce.body.toString());
                    if (json["status"] == "Success") {
                      print("successfully stored");
                    } else {
                      print("not stored");
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: StyleResources.txtgreen,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
// body: SingleChildScrollView(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Padding(
//         padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
//         child: CarouselSlider(
//           items: [
//             Container(
//               margin: EdgeInsets.all(6.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 image: DecorationImage(
//                   image: NetworkImage(imgurl+widget.img1),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.all(6.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 image: DecorationImage(
//                   image: NetworkImage(imgurl+widget.img2),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             //3rd Image of Slider
//             Container(
//               margin: EdgeInsets.all(6.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 image: DecorationImage(
//                   image: NetworkImage(imgurl+widget.img3),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//
//           ],   options: CarouselOptions(
//           height: 200.0,
//           enlargeCenterPage: true,
//           autoPlay: true,
//           aspectRatio: 16 / 9,
//           autoPlayCurve: Curves.fastOutSlowIn,
//           enableInfiniteScroll: true,
//           autoPlayAnimationDuration: Duration(milliseconds: 800),
//           viewportFraction: 0.8,
//         ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
//         child: Text("Tittle - "+widget.pname,
//           style: TextStyle(
//             fontSize: 20, // Adjust font size as needed
//             fontWeight: FontWeight.bold, // Make text bold
//             color: StyleResources.headingtxt, // Set text color
//             decorationThickness: 2, // Set underline thickness
//             fontStyle: FontStyle.italic, // Make text italic
//             letterSpacing: 1.5, // Adjust letter spacing
//             // Add more styling properties as needed
//           ),
//         ),
//       ),
//       Text("Price - "+widget.price,
//         style: TextStyle(
//           fontSize: 20, // Adjust font size as needed
//           fontWeight: FontWeight.bold, // Make text bold
//           color: StyleResources.headingtxt, // Set text color
//           decorationThickness: 2, // Set underline thickness
//           fontStyle: FontStyle.italic, // Make text italic
//           letterSpacing: 1.5, // Adjust letter spacing
//           // Add more styling properties as needed
//         ),),
//       Text("Description - "+widget.desc,
//         style: TextStyle(
//           fontSize: 20, // Adjust font size as needed
//           fontWeight: FontWeight.bold, // Make text bold
//           color: StyleResources.headingtxt, // Set text color
//           decorationThickness: 2, // Set underline thickness
//           fontStyle: FontStyle.italic, // Make text italic
//           letterSpacing: 1.5, // Adjust letter spacing
//           // Add more styling properties as needed
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.fromLTRB(250, 10, 50, 0),
//         child: TextField(
//           controller: _qty,
//           keyboardType: TextInputType.number,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Qty',
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
//         child: ElevatedButton(onPressed: () async{
//           SharedPreferences pref = await SharedPreferences.getInstance();
//           var uid=pref.getString("userid");
//           var qty = _qty.text.toString();
//           Uri url = Uri.parse(UrlResources.Cart_URL);
//           var param = {"product_id":widget.pid,"user_id":uid,"qty":qty};
//           var responce = await http.post(url,body: param,);
//           if(responce.statusCode==200)
//             {
//               var json = jsonDecode(responce.body.toString());
//               if(json["status"]=="Success")
//                 {
//                   print("successfully stored");
//                 }
//               else
//                 {
//                   print("not stored");
//
//                 }
//             }
//
//
//         },
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
//               padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10), // Button border radius
//               ),
//               elevation: 3, // Elevation of the button
//             ),
//             child: Text("Add to cart",
//             style: TextStyle(fontSize: 20),)
//         ),
//       )
//     ],
//   ),
// ),
    );
  }
}
