import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:third/Utils/Func.dart';

import '../../Model/class_category.dart';

class classSubpage3 extends StatelessWidget {

  final Categoryclass category;
  classSubpage3({required this.category});

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Image.asset(category.image_path, width: size.width*0.9, fit: BoxFit.cover),
          RatingBar.builder(
            initialRating: category.rating,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          SizedBox(height: 20),
          Text(category.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(category.description, style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}