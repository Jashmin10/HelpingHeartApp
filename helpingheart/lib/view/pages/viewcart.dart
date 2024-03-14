import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
import 'package:helpingheart/view/pages/order.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Resources/UrlResources.dart';

class viewcart extends StatefulWidget {
  const viewcart({super.key});

  @override
  State<viewcart> createState() => _viewcartState();
}

class _viewcartState extends State<viewcart> {
var username;
  Future<List?>? alldata;
  var imgurl =UrlResources.productimg;
  Future<List?>?getdata()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString("userid");
     setState(() {
       username = prefs.getString("username");
       print(username);
     });
    print(uid);
    // print(widget.id);
    Uri url = Uri.parse(UrlResources.CartView_URL);
    var responce = await http.post(url,body: {
      "id":uid
    });
    if(responce.statusCode==200)
    {
      //print("object123");
      var body = responce.body.toString();
      var json=jsonDecode(body);
      // print(json["data"]);
      return json["data"];
    }


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      alldata = getdata();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart List"),
      centerTitle: true,),
      body: FutureBuilder(
        future: alldata,
        builder: (context,snapshot) {
          if (snapshot.hasData)
          {
            if(snapshot.data!.length<=0)
            {
              return Center(child: Text("No data"),);
            }
            else
            {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index)
                {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200, // Background color
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  imgurl + snapshot.data![index]["img1"].toString(),
                                  height: 100, // Adjust the height as needed
                                  width: 100,  // Adjust the width as needed
                                  fit: BoxFit.cover, // Adjust the fit as needed
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15), // Image border radius
                                child: Text("Tittle : "+snapshot.data![index]["tittle"].toString(),
                                  style: TextStyle(fontSize: 20),),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15), // Image border radius
                                child: Text("Price : "+snapshot.data![index]["price"].toString(),
                                  style: TextStyle(fontSize: 20),),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Text("Quantity : "+snapshot.data![index]["qty"].toString(),
                                style: TextStyle(fontSize: 20),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
          else
          {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>order())
          );
        },
        child: Container(
          height: 60,
          child: Center(child: Text("Place Order",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:StyleResources.btncolor,
          ),
          width: MediaQuery.of(context).size.width,

        ),
      ),
    );
  }
}
