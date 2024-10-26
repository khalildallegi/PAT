import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final String email = 'associationpat17@gmail.com';
  final String phone = '55 516 213 / 53 334 543';
  final String mapUrl = 'https://www.google.com/maps?q=Ariana,+Tunisia&hl=fr';
  final String fburl = 'https://www.facebook.com/AssoPAT?locale=fr_FR';
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/ee.mp4')
      ..initialize().then((_) {
        setState(() {});
      }).catchError((error) {
        print('Error initializing video player: $error');
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('About Us', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          _buildBackgroundGradient(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                _buildTitleSection(),
                SizedBox(height: 20),
                _buildVideoSection(),
                SizedBox(height: 20),
                _buildInfoCard(),
                SizedBox(height: 20),
                _buildContactCard(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Background gradient
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

  // Title section with a centered title and description
  Widget _buildTitleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Text(
            'About the Association',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'We are a non-profit organization dedicated to the protection and well-being of animals in Tunis. '
            'Our mission is to rescue, rehabilitate, and rehome animals in need.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Video section with play/pause functionality
  Widget _buildVideoSection() {
    return Column(
      children: [
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(), backgroundColor: Colors.white,
              padding: EdgeInsets.all(12), // Button background color
            ),
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              size: 30,
              color: Colors.purple.shade900,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoPlayer(_controller),
          ),
        ),
      ],
    );
  }

  // Info Card with organization description
  Widget _buildInfoCard() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Who We Are',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'The Animal Protection Association of Tunisia (PAT) is a non-profit organization dedicated to helping animals in distress. It focuses on rescuing injured or abandoned street animals, with the goal of finding them loving, permanent homes. The association operates a shelter located in the suburbs of Tunis on a 9,000 m² plot of land. The shelter houses around 150 cats and dogs, most of which are available for adoption. The shelter runs on donations (both financial and material) and sponsorships.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Contact Info Card
  Widget _buildContactCard() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildContactRow(Icons.email, 'Email', email, 'mailto:$email'),
            SizedBox(height: 10),
            _buildContactRow(Icons.phone, 'Phone', phone, 'tel:$phone'),
            SizedBox(height: 10),
            _buildContactRow(
                Icons.location_on, 'Location', 'Ariana, Tunisia', mapUrl),
            SizedBox(
              height: 10,
            ),
            _buildContactRow(
                Icons.facebook, 'Facebook Page', 'Facebook', fburl),
          ],
        ),
      ),
    );
  }

  // Contact row with icons and links
  Widget _buildContactRow(
      IconData icon, String title, String value, String url) {
    return Row(
      children: [
        Icon(icon, color: Colors.purple.shade900),
        SizedBox(width: 10),
        Text(
          '$title: ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        InkWell(
          onTap: () => _launchUrl(Uri.parse(url)),
          child: Text(
            value,
            style: TextStyle(
                fontSize: 16,
                color: Colors.purple.shade900,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  // Helper method to launch URLs
  void _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
