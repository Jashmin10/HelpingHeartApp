import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/UrlResources.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class donation_form extends StatefulWidget {
  const donation_form({super.key});

  @override
  State<donation_form> createState() => _donation_formState();
}

class _donation_formState extends State<donation_form> {
  ImagePicker _picker = ImagePicker();
  File? imagefile = null;
  final _formKey = GlobalKey<FormState>();
  String? _selectedAmount=null;
  TextEditingController _items = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _img1 = TextEditingController();
  TextEditingController _img2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> Options = [
      '1 5',
      '2 10',
      '3 20',
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Donation Form"),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _items,
                decoration: InputDecoration(
                  labelText: 'Items',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter items name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _desc,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedAmount,
                onChanged: (newValue) {
                  setState(() {
                    _selectedAmount = newValue;
                  });
                },
                items: Options.map((String amount) {
                  return DropdownMenuItem<String>(
                    value: amount,
                    child: Text(amount),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Select in KG',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select in KG';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),
              Row(
                children: [
                  (imagefile!=null)?Image.file(imagefile!,height: 100,):Image.asset('assets/images/donation1.jpg' , height: 100,width: 100,),
                  TextButton(onPressed: () async {

                    XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                    setState(() {
                      imagefile =File(photo!.path);
                    });
                  }, child: Text("Camera")),
                  TextButton(onPressed: () async {

                    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      imagefile =File(photo!.path);
                    });
                  }, child: Text("Gallery")),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async{
                  if (_formKey.currentState!.validate()) {
                    print(imagefile.toString());
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    var uid = pref.getString("userid").toString();
                    var type="food";
                    var items = _items.text.toString();
                    var desc = _desc.text.toString();
                    var qty = "1";
                    var img1 =imagefile!.path.toString();
                    var img2 =imagefile!.path.toString();
                    var status = "done";



                    Uri url =Uri.parse(UrlResources.DonationForm_URL);

                    var param ={"user_id":uid,"type":type, "items": items,"description": desc,"approxfood_inkg":qty,"img1":img1,"img2":img2,"status":status};
                    var response = await http.post(url, body: param);

                    if(response.statusCode==200)
                      {
                        var json = jsonDecode(response.body.toString());
                        print (json["status"].toString());
                        if(json["status"]=="Success"){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(json["message"]),
                            ),
                          );
                        }
                        else
                          {
                          ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                          content: Text(json["message"]),
                          ),
                          );
                          }
                      }
                    // Form is valid, submit data
                    // You can perform your donation submission logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Donation submitted successfully')),
                    );
                  }
                },
                child: Text('Donate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: donation_form(),
  ));
}