import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:third/Model/Doctor.dart';

import '../Model/Appcolor.dart';

class DoctorRow extends StatelessWidget {
  final Doctor wObj;

  const DoctorRow({super.key, required this.wObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  wObj.image.toString(),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wObj.name.toString(),
                    style: TextStyle(color: MyColors.blackColor, fontSize: 12),
                  ),
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: wObj.rating,
                    direction: Axis.horizontal,
                    itemSize: 25.0,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/icons/next_page.png",
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            )
          ],
        )
    );
  }
}
