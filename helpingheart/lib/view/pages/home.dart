import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
import 'package:helpingheart/Resources/UrlResources.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  home({Key? key}): super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Future<List?>? allArticledata;
  Future<List?>? allDonationdata;
  var dimg = UrlResources.donationimg;
  var imgurl = UrlResources.articleimg;
  Future<List?>?getArticledata()async{
    Uri url = Uri.parse(UrlResources.Article_URL);
    Uri url1 = Uri.parse(UrlResources.Donation_URL);
    var responce = await http.get(url);
    var res = await http.get(url1);
    print(responce.statusCode.toString());
    if(responce.statusCode==200)
      {
        var json = jsonDecode(responce.body.toString());
        print(json.toString());
        if(json["status"]=="Success")
          {
            return json['data'];
          }
        else
          {
            return [];
          }

      }

  }
  Future<List?>?getDonationdata()async{
    Uri url = Uri.parse(UrlResources.Donation_URL);
    var responce = await http.get(url);
    print(responce.statusCode.toString());
    if(responce.statusCode==200)
    {
      var json = jsonDecode(responce.body.toString());
      print(json.toString());
      if(json["status"]=="Success")
      {
        return json['data'];
      }
      else
      {
        return [];
      }

    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      allArticledata = getArticledata();
      allDonationdata = getDonationdata();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 35,
                child: Text(
                  'Recent Donation',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: StyleResources.headingtxt),
                ),
              ),
            ),
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child:  FutureBuilder(
                future: allDonationdata,
                builder: (context, snapshot)
                {
                  if(snapshot.hasData)
                  {
                    if(snapshot.data!.length<=0)
                    {
                      return Center(child: Text("No Data"),);
                    }
                    else
                    {
                      return ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (contex,index){
                            return  Container(
                              child:Column(
                                children: [
                                  Image.network(dimg+snapshot.data![index]["img1"].toString(),
                                    height: 250,
                                    width: 250,),
                                  Text(snapshot.data![index]["items"].toString()),
                                  Text(snapshot.data![index]["description"].toString()),
                                ],
                              ) ,
                            );

                            // Image(image: imgurl + snapshot.data![index]["img1"].toString(),),
                          });
                      //   GridView.builder(
                      //   padding: EdgeInsets.all(16.0),
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //     //crossAxisSpacing: 16.0,
                      //    // mainAxisSpacing: 16.0,
                      //   ),
                      //   itemCount: snapshot.data!.length,
                      //   itemBuilder: (context, index) {
                      //     return Padding(
                      //       padding: EdgeInsets.all(10),
                      //       child: Container(
                      //         height: 500,
                      //         width: MediaQuery.of(context).size.width,
                      //         decoration: BoxDecoration(
                      //           color: Colors.grey.shade200, // Background color
                      //           borderRadius: BorderRadius.circular(15),
                      //           boxShadow: [
                      //             BoxShadow(
                      //               color: Colors.grey.withOpacity(0.5),
                      //               spreadRadius: 2,
                      //               blurRadius: 5,
                      //               offset: Offset(0, 3), // changes position of shadow
                      //             ),
                      //           ],
                      //         ),
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Expanded(
                      //               child: Padding(
                      //                 padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      //                 child: ClipRRect(
                      //                   borderRadius: BorderRadius.circular(15), // Image border radius
                      //                   child: Image.network(
                      //                     imgurl + snapshot.data![index]["img1"].toString(),
                      //                     height: 100,
                      //                     width: 100,
                      //                     fit: BoxFit.cover,),
                      //                 ),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               child: Container(
                      //                 padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      //                 child: Text(snapshot.data![index]["tittle"].toString(),
                      //                   style: TextStyle(fontSize: 25),),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     );
                      //
                      //   },
                      //
                      // );
                    }
                  }
                  else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: SizedBox(
                height: 225,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildDonationItem(image: 'assets/images/donation1.jpg', label: 'Food Donation'),
                    SizedBox(width: 10),
                    _buildDonationItem(image: 'assets/images/donation1.jpg', label: 'Book Donation'),
                    SizedBox(width: 10),
                    _buildDonationItem(image: 'assets/images/donation1.jpg', label: 'Cloths Donation'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Container(

                width: MediaQuery.of(context).size.width,
                height: 35,
                child: Text(
                  'Choose your donation',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: StyleResources.headingtxt),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
              child: SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildDonationCategory(image: 'assets/images/donation2.jpg', label: 'Food'),
                    SizedBox(width: 20),
                    _buildDonationCategory(image: 'assets/images/donation2.jpg', label: 'Cloths'),
                    SizedBox(width: 20),
                    _buildDonationCategory(image: 'assets/images/donation2.jpg', label: 'Book'),
                    SizedBox(width: 20),
                    _buildDonationCategory(image: 'assets/images/donation2.jpg', label: 'Money'),
                    SizedBox(width: 20),
                    _buildDonationCategory(image: 'assets/images/donation2.jpg', label: 'Etc'),
                  ],
                ),
              ),
            ),
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Article",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: StyleResources.headingtxt),
                  ),
                  Text("See all",
                    style: TextStyle(fontSize: 16, color: StyleResources.txtgreen),
                  ),
                ],
              ),
            ),
           Padding(padding: EdgeInsets.all(10)),
           Container(
             height: 300,
             width: MediaQuery.of(context).size.width,
             child:  FutureBuilder(
               future: allArticledata,
               builder: (context, snapshot)
               {
                 if(snapshot.hasData)
                 {
                   if(snapshot.data!.length<=0)
                   {
                     return Center(child: Text("No Data"),);
                   }
                   else
                   {
                     return ListView.builder(
                         itemCount: 3,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (contex,index){
                           return  Container(
                             child:Column(
                               children: [
                                 Image.network(imgurl+snapshot.data![index]["img1"].toString(),
                                 height: 250,
                                 width: 250,),
                                 Text(snapshot.data![index]["tittle"].toString()),
                                 Text(snapshot.data![index]["description"].toString()),
                               ],
                             ) ,
                           );

                          // Image(image: imgurl + snapshot.data![index]["img1"].toString(),),
                         });
                     //   GridView.builder(
                     //   padding: EdgeInsets.all(16.0),
                     //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     //     crossAxisCount: 2,
                     //     //crossAxisSpacing: 16.0,
                     //    // mainAxisSpacing: 16.0,
                     //   ),
                     //   itemCount: snapshot.data!.length,
                     //   itemBuilder: (context, index) {
                     //     return Padding(
                     //       padding: EdgeInsets.all(10),
                     //       child: Container(
                     //         height: 500,
                     //         width: MediaQuery.of(context).size.width,
                     //         decoration: BoxDecoration(
                     //           color: Colors.grey.shade200, // Background color
                     //           borderRadius: BorderRadius.circular(15),
                     //           boxShadow: [
                     //             BoxShadow(
                     //               color: Colors.grey.withOpacity(0.5),
                     //               spreadRadius: 2,
                     //               blurRadius: 5,
                     //               offset: Offset(0, 3), // changes position of shadow
                     //             ),
                     //           ],
                     //         ),
                     //         child: Column(
                     //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     //           children: [
                     //             Expanded(
                     //               child: Padding(
                     //                 padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                     //                 child: ClipRRect(
                     //                   borderRadius: BorderRadius.circular(15), // Image border radius
                     //                   child: Image.network(
                     //                     imgurl + snapshot.data![index]["img1"].toString(),
                     //                     height: 100,
                     //                     width: 100,
                     //                     fit: BoxFit.cover,),
                     //                 ),
                     //               ),
                     //             ),
                     //             Expanded(
                     //               child: Container(
                     //                 padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                     //                 child: Text(snapshot.data![index]["tittle"].toString(),
                     //                   style: TextStyle(fontSize: 25),),
                     //               ),
                     //             ),
                     //           ],
                     //         ),
                     //       ),
                     //     );
                     //
                     //   },
                     //
                     // );
                   }
                 }
                 else{
                   return Center(child: CircularProgressIndicator(),);
                 }
               },
             ),
           ),
            // Row(
            //   children: [
            //     Column(
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(8.0),
            //           child: Image(
            //             image: AssetImage('assets/images/donation1.jpg'),
            //             width: 150,
            //             height: 150,
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            //           child: Text(
            //             "this is first article for food donation",
            //             style: TextStyle(color: StyleResources.headingtxt),
            //           ),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.circular(8.0),
            //           child: Image(
            //             image: AssetImage('assets/images/donation1.jpg'),
            //             width: 150,
            //             height: 150,
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            //           child: Text(
            //             "this is first article for food donation",
            //             style: TextStyle(color: StyleResources.headingtxt),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),

          ],
        ),
      ),
    );
  }

  Widget _buildDonationItem({required String image, required String label}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            image: AssetImage(image),
            width: 150,
            height: 180,
          ),
        ),
        SizedBox(height: 10),
        Text(label),
      ],
    );
  }

  Widget _buildDonationCategory({required String image, required String label}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            image: AssetImage(image),
            width: 80,
            height: 80,
          ),
        ),
        SizedBox(height: 10),
        Text(label),
      ],
    );
  }
}

