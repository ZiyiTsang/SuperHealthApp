import 'package:flutter/cupertino.dart';

import '../../Component/item_grid.dart';
import '../../Model/class_category.dart';

class classPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child:GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 12,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          for (var i = 0; i < 6; i++)
            CategoryGridItem(category: Categoryclass.getAllCategories()[i]),

        ],
      ),
    );
  }
}
