import 'package:flutter/material.dart';

class AdoptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adopt an Animal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to Adopt a Pet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'To adopt a pet, please fill out our adoption application. We will review your application and contact you for a meet-and-greet.',
              style: TextStyle(fontSize: 18),
            ),
            // Add more content about the adoption process
          ],
        ),
      ),
    );
  }
}
