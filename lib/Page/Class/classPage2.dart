import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:third/Page/Home/home.dart';
import 'package:third/Model/Contact.dart';

class classPage2 extends StatelessWidget {
  classPage2({Key? key}) : super(key: key);
  final List<Contact> contacts = Contact.get_all_contact();

  @override
  Widget build(context) {
    return ListView.separated(
      itemCount: this.contacts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(contacts[index].image_path),
                  constraints: BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                    minHeight: 150,
                    minWidth: 150,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(contacts[index].name,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto')),
                SizedBox(
                  height: 10,
                ),
                Text(contacts[index].email,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Roboto')),
                SizedBox(
                  height: 2,
                ),
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
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
    );
  }
}
