import 'package:flutter/material.dart';

class AccommodationPage extends StatelessWidget {
  const AccommodationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        Image.asset('assets/images/hotel.jpg'),
        const SizedBox(height: 35),
        const Text("Stay in Style, Experience \n Comfort, Create Memories.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 25),
        const Text(
            "Discover your home away from home \n in our boutique hotel.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black54)),
      ],
    )));
  }
}
