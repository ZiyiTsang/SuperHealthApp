import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;

  TodoItem({required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.check_box_outline_blank),
          SizedBox(width: size.width * 0.02),
          Text(
            title,
            style: TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
