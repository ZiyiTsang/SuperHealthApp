import 'dart:ui';

import 'package:flutter/material.dart';

class categoryModel {
  String name;
  String image;
  Color boxColor;
  categoryModel({required this.name, required this.image, required this.boxColor});

  static List<categoryModel> getCatogories_fromHandWrite(){
    return <categoryModel>[
      categoryModel(name: "Electronics", image: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2", boxColor: Colors.blue),
      categoryModel(name: "Fashion", image: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2", boxColor: Colors.pink),
      categoryModel(name: "Home", image: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2", boxColor: Colors.blue),
      categoryModel(name: "Appliances", image: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2", boxColor: Colors.pink),
      categoryModel(name: "Beauty", image: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2", boxColor: Colors.blue),
      categoryModel(name: "Toys", image: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2", boxColor: Colors.pink),
      categoryModel(name: "Books", image: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2", boxColor: Colors.blue),
      categoryModel(name: "Sports", image: "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2", boxColor: Colors.pink),
    ];
  }
}

