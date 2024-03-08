import 'package:flutter/material.dart';
import 'package:helpingheart/Resources/StyleResources.dart';
import 'package:helpingheart/view/authentication/change_password.dart';

class home extends StatefulWidget {
  home({Key? key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: SizedBox(
                height: 210,
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
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
              child: SizedBox(
                height: 210,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildDonationItem(image: 'assets/images/donation1.jpg',
                        label: 'this is first article for food donation'),
                    SizedBox(width: 10),
                    _buildDonationItem(image: 'assets/images/donation1.jpg',
                        label: 'this is second article for food donation'),
                    SizedBox(width: 10),
                    _buildDonationItem(image: 'assets/images/donation1.jpg',
                        label: 'this is third article for food donation'),
                  ],
                ),
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

