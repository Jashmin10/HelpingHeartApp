import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/UrlResources.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class donatelist extends StatefulWidget {
  const donatelist({super.key});

  @override
  State<donatelist> createState() => _donatelistState();
}

class _donatelistState extends State<donatelist> {
  var username;
  Future<List?>? alldata;
  var imgurl = UrlResources.donationimg;
  Future<List?>?getdata()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var uid = pref.getString("userid");
    setState(() {
      username = pref.getString("username");
      print(username);
    });
    print(uid);
    Uri url = Uri.parse(UrlResources.Donation_URL);
    var response = await http.post(url,body: {
      "id":uid
    });
    if(response.statusCode==200)
      {
        var body = response.body.toString();
        var json = jsonDecode(body);
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
      appBar: AppBar(title: Text("Donation List"),centerTitle: true,),
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
                                child: Text(snapshot.data![index]["items"].toString(),
                                  style: TextStyle(fontSize: 20),),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15), // Image border radius
                                child: Text(snapshot.data![index]["description"].toString(),
                                  style: TextStyle(fontSize: 20),),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Text(snapshot.data![index]["type"].toString(),
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
    );
  }
}
