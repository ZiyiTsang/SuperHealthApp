import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:third/Page/Setting/profileDetail.dart';
import 'package:third/PageSturcture/subPage.dart';
import 'package:third/Utils/NetworkUtils.dart';

import '../../Utils/Func.dart';
import '../Class/classPage.dart';
import '../Class/classPage2.dart';
import '../Login/Default_Login.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubPage(
                        pageTitle: "Account",
                        pageInstance: ProfileDetailPage(),
                        color: Colors.blue
                    ),
                  ));
            },
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('John Doe',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto')),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: Image.network(
                                "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2")
                            .image,
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('上课',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto')),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SubPage(pageTitle: "666", pageInstance: classPage(),color: Colors.blue,),
                  ));
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('上课2',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto')),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SubPage(pageTitle: "666", pageInstance: classPage2(),color:Colors.blue),
                  ));
            },
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Network',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto')),
              ),
            ),
            onTap: () {

              NetworkUtils().try_network().then((value) {
                showNetworkStatusDialog(context, value);
              });
            },
          ),
        ],
      ),
    );
  }
}



