import 'package:flutter/material.dart';
import 'package:third/PageSturcture/subPage.dart';

import '../Model/class_category.dart';
import '../Page/Class/classSubpage3.dart';


class CategoryGridItem extends StatelessWidget{
  const CategoryGridItem({
    super.key,
    required this.category,
  });

  final Categoryclass category;

  @override
  Widget build(context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SubPage(pageTitle: category.title, pageInstance: classSubpage3(category: category,), color: Colors.blueGrey)
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: category.color
        ),
        child: Text(
            category.title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25
            )
        ),
      ),
    );
  }
}