import 'package:flutter/cupertino.dart';

class cruise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Image.asset('assets/images/cruise.jpg'),
        Text(
          "Cruise: Happy ship!!",
          style: TextStyle(fontSize: 30),
        ),
        Text(
          "Price:180,000RMB",
          style: TextStyle(fontSize: 20),
        ),
      ],
    ));
  }
}
