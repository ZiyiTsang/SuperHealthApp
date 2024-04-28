import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:third/Page/Home/home.dart';

class classPage extends StatelessWidget {
  const classPage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Center(
      child: Container(
          width: 350,
          height: 350,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/images/cheesecake.jpg'),
                    constraints: BoxConstraints(
                      maxHeight: 150,
                      maxWidth: 150,
                      minHeight: 150,
                      minWidth: 150,
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text('Cheese Cake',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto')),
                  SizedBox(height: 10,),
                  Text('Cheese Cake is a sweet dessert consisting of one or more layers',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto')),
                  SizedBox(height: 2,),
                  RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
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

                ],
              )
            ),
          )),
    );
  }
}
