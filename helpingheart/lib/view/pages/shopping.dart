import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/view/pages/sub_category.dart';

import '../../Resources/UrlResources.dart';
import 'package:http/http.dart' as http;

class shopping extends StatefulWidget {
  const shopping({super.key});

  @override
  State<shopping> createState() => _shoppingState();
}

class _shoppingState extends State<shopping> {
  Future<List?>? alldata;
  var imgurl = UrlResources.catimg;
  Future<List?>?getdata()async{

    Uri url = Uri.parse(UrlResources.Category_URL);
    var responce = await http.get(url);
    // print(responce.statusCode);
    if(responce.statusCode==200)
    {

      var json = jsonDecode(responce.body.toString());
      // print(json["data"]);
      return json['data'];
  }}

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
      body: FutureBuilder(
        future: alldata,
        builder: (context,snapshot)
        {
          if(snapshot.hasData)
            {
              if(snapshot.data!.length<=0)
                {
                  return Center(child: Text("No Data"),);
                }
              else{
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index)
                  {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        height: 100,
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
                                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15), // Image border radius
                                  child: Image.network(imgurl + snapshot.data![index]["cat_img"].toString(),height: 150,width: 150,),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(snapshot.data![index]["cat_name"].toString(),
                                style: TextStyle(fontSize: 25),),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // Handle right arrow button press
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>sub_category(catid:snapshot.data![index]["cat_id"].toString())));
                              },
                              icon: Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}


