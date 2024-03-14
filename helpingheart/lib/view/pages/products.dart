import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/UrlResources.dart';
import 'package:helpingheart/view/pages/productdetails.dart';
import 'package:helpingheart/view/pages/viewcart.dart';
import 'package:http/http.dart' as http;

class products extends StatefulWidget {
  var id;
   products({super.key,this.id});

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {

  Future<List?>? alldata;
  var imgurl =UrlResources.productimg;
  Future<List?>?getdata()async{
   // print(widget.id);
    Uri url = Uri.parse(UrlResources.Product_URL);
    var responce = await http.post(url,body: {
      "subcat_id":widget.id
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
      appBar: AppBar(title: Text("All Products"),centerTitle: true,
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
                  return GridView.builder(
                    padding: EdgeInsets.all(16.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15), // Image border radius
                                    child: Image.network(imgurl + snapshot.data![index]["img1"].toString(),
                                      height: 150,width: 150,
                                      fit: BoxFit.cover,),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: Text(snapshot.data![index]["tittle"].toString(),
                                    style: TextStyle(fontSize: 25),),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context)=>productdetails(
                                        pid:snapshot.data![index]["product_id"].toString(),
                                        pname: snapshot.data![index]["tittle"].toString(),
                                        price: snapshot.data![index]["price"].toString(),
                                        img1: snapshot.data![index]["img1"].toString(),
                                        img2: snapshot.data![index]["img2"].toString(),
                                        img3: snapshot.data![index]["img3"].toString(),
                                        desc: snapshot.data![index]["description"].toString(),))
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
        },
      ),
    );
  }
}
