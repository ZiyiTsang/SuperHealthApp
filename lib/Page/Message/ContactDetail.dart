import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third/Model/Contact.dart';
import '../../Utils/Func.dart';
import '../../Utils/SharePref.dart';

class ContactDetail extends StatelessWidget {
  late final Contact person;
  ContactDetail({required this.person});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: Colors.white,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: getImage(person.imagePath),
                  ),
                  Text(
                  person.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Interesting thing is Everywhere",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.phone),
                        SizedBox(
                          width: 10,
                        ),
                        Text(person.phone),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.email_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Text(person.email),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.house_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Text(person.address),
                      ],
                    ),
                  ),


                  SizedBox(
                    height: 20,
                  ),
                ])));
  }
}