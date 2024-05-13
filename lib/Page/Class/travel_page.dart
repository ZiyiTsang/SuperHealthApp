import 'package:flutter/material.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        Image.asset('assets/images/home.jpg'),
        const SizedBox(height: 40),
        const Text("Discover, Wander, Experience: \nYour Journey Begins Here!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const Text(
            "Embark on unforgettable adventures with\n our premier tourist agency. ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black54)),
      ],
    )));
  }
}
