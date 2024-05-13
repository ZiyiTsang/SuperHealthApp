import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: [
        Image.asset('assets/images/food.jpg'),
        const SizedBox(height: 40),
        const Text("Quick bites, bold flavors \n satisfy cravings in minutes!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const Text(
            "Instant gratification with our \n delicious fast food favorites!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black54)),
      ],
    )));
  }
}
