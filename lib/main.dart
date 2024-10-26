import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(AnimalProtectionApp());
}

class AnimalProtectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Association de Protection des Animaux de Tunisie - PAT ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
