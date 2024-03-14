import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/UrlResources.dart';
import 'package:helpingheart/view/pages/products.dart';
import 'package:http/http.dart' as http;

class sub_category extends StatefulWidget {
//  const sub_category({super.key});
  var catid;
  sub_category({required this.catid});
  @override
  State<sub_category> createState() => _sub_categoryState();
}

class _sub_categoryState extends State<sub_category> {
  Future<List?>? alldata;
  Future<List?>?getdata()async{
    print(widget.catid);

    Uri url = Uri.parse(UrlResources.SubCategory_URL);
    var responce = await http.post(url,body: {
      "cat_id":widget.catid
    });
    print(responce.statusCode);
    if(responce.statusCode==200)
    {
// print("object");
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
        builder: (context,snapshot){
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
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                              child: Container(
                                child: Text(snapshot.data![index]["name"].toString(),
                                  style: TextStyle(fontSize: 25),),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>products(id: snapshot.data![index]["subcat_id"].toString(),))
                                );
                                // Handle right arrow button press
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
          else
            {
              return Center(child: CircularProgressIndicator(),);
            }
        }
      ),
    );
  }
}
