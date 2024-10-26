import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DonatePage extends StatelessWidget {
  final List<String> imageAssets = [
    'assets/exemple1.jpg',
    'assets/exemple2.jpg',
    'assets/exemple4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Donate', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background gradient
          _buildBackgroundGradient(),
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Carousel slider for images
                Center(
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 300,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    itemCount: imageAssets.length,
                    itemBuilder: (context, index, realIndex) {
                      final asset = imageAssets[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          asset,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Section 1: Why Donate?
                _buildInfoCard(
                  title: 'Why Donate to Help Dogs and Cats?',
                  description:
                      'Your donation helps provide food, medical care, and shelter to abandoned and stray dogs and cats. '
                      'With your contribution, we can rescue more animals and ensure they receive the care they deserve.\n\n'
                      'By supporting us, you directly improve the lives of pets in need, giving them a second chance at life and happiness.',
                ),
                SizedBox(height: 20),

                // Section 2: How Your Donation Helps
                Text(
                  'How Your Donation Helps',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                _buildHelpCard(),
                SizedBox(height: 20),

                // Call to action button
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      const url = 'https://fr.flouci.com/donations/pat';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Unable to open the donation page.')),
                        );
                      }
                    },
                    icon: Icon(Icons.credit_card_outlined),
                    label: Text('Donate Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 6,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the background gradient
  Widget _buildBackgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade400, Colors.blue.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  // Helper method to build the info card for "Why Donate?"
  Widget _buildInfoCard({required String title, required String description}) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a card with donation impact details
  Widget _buildHelpCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildHelpRow(
              Icons.pets,
              'Food and Nutrition',
              'Provide healthy meals and nutritional support to stray and abandoned animals.',
            ),
            SizedBox(height: 10),
            _buildHelpRow(
              Icons.local_hospital,
              'Medical Treatment',
              'Cover the cost of vaccines, surgeries, and regular check-ups.',
            ),
            SizedBox(height: 10),
            _buildHelpRow(
              Icons.home,
              'Shelter',
              'Provide safe, clean, and comfortable living spaces for dogs and cats waiting for adoption.',
            ),
            SizedBox(height: 10),
            _buildHelpRow(
              Icons.favorite,
              'Adoption Support',
              'Help cover the costs of adoption events and outreach programs.',
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build rows with icons and text
  Widget _buildHelpRow(IconData icon, String title, String description) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal, size: 30),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
