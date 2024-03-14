import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
import 'package:helpingheart/Resources/UrlResources.dart';
import 'package:helpingheart/view/pages/Dashboard.dart';
import 'package:helpingheart/view/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class order extends StatefulWidget {
  const order({super.key});

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  final _formKey = GlobalKey<FormState>();

  Razorpay _razorpay = Razorpay();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  var city;
  List<dynamic> cityData = [];

  getdata() async {
    Uri uri = Uri.parse(UrlResources.City);
    var responce = await http.get(uri);
    if (responce.statusCode == 200) {
      var body = jsonDecode(responce.body);
      setState(() {
        cityData = body['data'];
      });
    } else {
      print("api error");
    }
  }

  List? alldata1;
  var usercontact, useremail, uid;

  getcartdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      uid = prefs.getString("userid");
      usercontact = prefs.getString("userphone");
      useremail = prefs.getString("useremail");
      print(usercontact);
      print(useremail);
    });
    print(uid);
    // print(widget.id);
    Uri url = Uri.parse(UrlResources.CartView_URL);
    var responce = await http.post(url, body: {"id": uid});
    if (responce.statusCode == 200) {
      //print("object123");
      var body = responce.body.toString();
      var json = jsonDecode(body);
      // print(json["data"]);
      return json["data"];
    }
  }

  var finalamount = 0.0;
  int count = 0;
  var pid;

  getAllData() async {
    // if(count == 0)
    // {
    //   setState(() {
    //     alldata2 = getofferdata();
    //   });
    // }

    setState(() {
      finalamount = 0.0;
    });
    alldata1 = await getcartdata() as List;
    alldata1!.forEach((row) {
      setState(() {
        finalamount = finalamount +
            (double.parse(row["qty"].toString()) *
                double.parse(row["price"].toString()));
        pid = row["product_id"].toString();
        print("finalamount = ${finalamount}");
      });

      print("amount : " + row["quantity"].toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    getdata();
    getAllData();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse payresponse) async {
    // Do something when payment succeeds

    var datacity;
    var address = _addressController.text.toString();
    var pincode = _postalCodeController.text.toString();
    var landmark = _landmarkController.text.toString();
    // var datacity = city.toString();
    var totalpayment = finalamount.toString();
    var donationamount = double.parse(finalamount.toString()) * 2 / 100;
    var paymentid = payresponse.paymentId.toString();
    var status = "delivered";
    // var offerid =
    if (city == null) {
      setState(() {
        datacity = city['city_id'].toString();
      });
    } else {
      setState(() {
        datacity = cityData[0]['city_id'].toString();
      });
    }

    print("uis = ${uid.toString()}");
    print("address = ${address.toString()}");
    print("lan = ${landmark.toString()}");
    print("pin = ${pincode.toString()}");
    print("city = ${datacity.toString()}");
    print("total = ${totalpayment.toString()}");
    print("donation = ${donationamount.toString()}");
    print("pid = ${paymentid.toString()}");
    print("status = ${status.toString()}");

    //print("userid = ${uid}");

    Uri url = Uri.parse(UrlResources.Placeorder);

    var param = {
      "user_id": uid.toString(),
      "address": address.toString(),
      "landmark": landmark.toString(),
      "pincode": pincode.toString(),
      "city_id": datacity.toString(),
      "total_payment": totalpayment.toString(),
      "donation_amount": donationamount.toString(),
      "payment_id": paymentid.toString(),
      "status": status.toString(),
    };
    var responce = await http.post(
      url,
      body: param,
    );

   // print(url);
    print("status:"  + responce.statusCode.toString());
    if (responce.statusCode == 200) {
     // print("object");
      var json = jsonDecode(responce.body.toString());
      print("json : " + jsonEncode(json)); // Convert json map to string
      if (json["status"] == "Success") {
      //  print("pajsonyment success");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(json["message"]),
          ),
        );
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(json["message"]),
          ),
        );
      }
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails

    print("payment fails");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print("wallet error");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Order"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping Details',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),

                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _landmarkController,
                  decoration: InputDecoration(
                    labelText: 'Landmark',
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your landmark';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Container(
                  child: Row(
                    children: [
                      Text("City Name :"),
                      SizedBox(
                        width: 15,
                      ),
                      cityData.isNotEmpty
                          ? DropdownButton(
                              // dropdownColor: Color(0xffa4469c),
                              hint: Text("Select City"),
                              // value: city == null || city.isEmpty? cityData[0]:city,
                              value: city,
                              items: cityData.map((value) {
                                return DropdownMenuItem<dynamic>(
                                  value: value,
                                  child: Text(value['city_name']),
                                );
                              }).toList(),
                              onChanged: (value) {
                                print("value = ${value}");
                                setState(() {
                                  city = value!;
                                });
                              },
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _postalCodeController,
                  decoration: InputDecoration(
                    labelText: 'Pin Code',
                    prefixIcon: Icon(Icons.mail),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your pin code';
                    }
                    return null;
                  },
                ),
                // SizedBox(height: 16.0),
                // TextFormField(
                //   controller: _postalCodeController,
                //   decoration: InputDecoration(
                //     labelText: 'Total Payment',
                //     prefixIcon: Icon(Icons.account_balance_wallet),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Total payment.';
                //     }
                //     return null;
                //   },
                // ),
                // SizedBox(height: 16.0),
                // TextFormField(
                //   controller: _postalCodeController,
                //   decoration: InputDecoration(
                //     labelText: 'Total Donation',
                //     prefixIcon: Icon(Icons.monitor_heart_sharp),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Total Donation';
                //     }
                //     return null;
                //   },
                // ),
                // SizedBox(height: 16.0),
                // TextFormField(
                //   controller: _postalCodeController,
                //   decoration: InputDecoration(
                //     labelText: 'Payment ID',
                //     prefixIcon: Icon(Icons.payment_sharp),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Payment ID';
                //     }
                //     return null;
                //   },
                // ),
                // SizedBox(height: 16.0),
                // TextFormField(
                //   controller: _postalCodeController,
                //   decoration: InputDecoration(
                //     labelText: 'Offer List',
                //     prefixIcon: Icon(Icons.local_offer),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please Select Offers';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var options = {
                          'key': 'rzp_test_BIvh74xcCk98Hs',
                          'amount': finalamount * 100,
                          'name': 'Acme Corp.',
                          'description': 'Fine T-Shirt',
                          'prefill': {
                            'contact': usercontact,
                            'email': useremail
                          }
                        };
                        _razorpay.open(options);
                        // Place order logic here
                        // If form is valid, you can access form data using _fullNameController.text, _addressController.text, etc.
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      backgroundColor: StyleResources.txtgreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Confirm Order : ₹' + finalamount.toString(),
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
