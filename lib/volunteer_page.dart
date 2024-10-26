import 'package:flutter/material.dart';

class VolunteerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteer with Us'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Volunteer Opportunities',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Join our team of volunteers! We offer various opportunities, from fostering animals to helping at events.',
              style: TextStyle(fontSize: 18),
            ),
            // Add more content about volunteering
          ],
        ),
      ),
    );
  }
}
