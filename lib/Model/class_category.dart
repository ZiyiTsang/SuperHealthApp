import 'package:flutter/material.dart';

class Categoryclass {

  String id;
  String title;
  Color color;
  String  description = "66666666666666666";
  String image_path = "assets/images/food.jpg";
  double rating = 0.0;  // 0.0 ~ 5.0

  Categoryclass({
    required this.id,
    required this.title,
    required this.color,
    required String this.description,
    required String this.image_path,
    this.rating = 4.0
  });

  static List <Categoryclass> getAllCategories(){
    List <Categoryclass> categories = [];

    categories.add(
        Categoryclass(
            id: 'c1',
            title: "Italian",
            color: Colors.purple,
            description: "This is Italian food,12345678",
            image_path: "assets/images/italian.jpg",
            rating: 4.5
        )
    );

    categories.add(
        Categoryclass(
            id: 'c2',
            title: "French",
            color: Colors.amber,
            description: "This is French food,123456",
          image_path: "assets/images/french.jpg",
          rating: 4.0

        )
    );

    categories.add(
        Categoryclass(
            id: 'c3',
            title: "Chinese",
            color: Colors.blue,
            description: "This is Chinese food,6666",
          image_path: "assets/images/chinese.jpg",
          rating: 4.0
        )
    );

    categories.add(
        Categoryclass(
            id: 'c4',
            title: "Indian",
            color: Colors.green,
            description: "This is Indian food,99999",
          image_path: "assets/images/indian.jpg",
          rating: 4.0
        )
    );

    categories.add(
        Categoryclass(
            id: 'c5',
            title: "Korean",
            color: Colors.pink,
            description: "This is Korean food,aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          image_path: "assets/images/korean.jpg",
          rating: 4.0

        )
    );

    categories.add(
        Categoryclass(
            id: 'c6',
            title: "Mexican",
            color: Colors.teal,
            description: "This is Mexican food,aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          image_path: "assets/images/mexican.jpg",
          rating: 4.0
        )
    );
    return categories;
  }
}

