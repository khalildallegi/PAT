import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import for URL launching
import 'about_page.dart';
import 'adopt_page.dart';
import 'volunteer_page.dart';
import 'donate_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Association de Protection des Animaux de Tunisie - PAT'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildWelcomeSection(),
            _buildLinksSection(context),
            _buildBlogSection(context),
            _buildAuthorSection(), // Add the author section
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Colors.blue],
        ),
      ),
      child: const Center(
        child: Text(
          'Welcome to Our Animal Protection Association',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'logo.jpg',
              width: double.infinity,
              height: 300,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Our mission is to rescue, rehabilitate, and find loving homes for abandoned and abused animals in Tunisia. Join us in making a difference!',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildLinksSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildStyledLink(context, 'About Us', AboutPage()),
            _buildStyledLink(context, 'Adopt an Animal', AdoptPage()),
            _buildStyledLink(context, 'Volunteer', VolunteerPage()),
            _buildStyledLink(context, 'Donate', DonatePage()),
          ],
        ),
      ),
    );
  }

  Widget _buildStyledLink(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blueAccent, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  Widget _buildBlogSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Latest Blog Posts',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildBlogPost(
              'How to Adopt a Pet',
              'Learn about the adoption process and what to consider before bringing a pet home.',
              context),
          const SizedBox(height: 16),
          _buildBlogPost(
              'Volunteer Opportunities',
              'Discover various ways you can help our organization and make a difference.',
              context),
          const SizedBox(height: 16),
          _buildBlogPost(
              'Making a Donation',
              'Your contributions help us care for and rehabilitate animals in need.',
              context),
        ],
      ),
    );
  }

  Widget _buildBlogPost(
      String title, String description, BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(200, 30, 200, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                // Navigate to detailed blog post page if available
              },
              child: const Text(
                'Read more...',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Author credentials section
  Widget _buildAuthorSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(700, 10, 700, 10),
      color: Colors.blueAccent, // Different background color
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            const Text(
              'Developed by Khalil Dallegi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () async {
                const url =
                    'https://www.linkedin.com/in/khalil-dallegi-765807317';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              icon: Image.network(
                'data:image/png;base64,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', // LinkedIn logo URL
                height: 24,
              ),
              label: const Text('Visit my LinkedIn'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[700], // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
