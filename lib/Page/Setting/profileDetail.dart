import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third/Component/RoundButton.dart';

import '../../Utils/SharePref.dart';

class ProfileDetailPage extends StatelessWidget {
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
                    backgroundImage: Image.network(
                            "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2")
                        .image,
                  ),
                  Text(
                    'Name: John Doe',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Build for better world",
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
                        Text('0123456789'),
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
                        Text('CME1909120@xmu.edu.my'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundButton(
                    text: "Logout",
                    press: () {
                      SharedPreferencesHelper().clearUser();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    scale: 0.7,
                  ),

                  SizedBox(
                    height: 20,
                  ),
                ])));
  }
}
