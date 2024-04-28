import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Model/Recent_contact.dart';
import '../../PageSturcture/subPage.dart';
import 'Chat.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<RecentContact> recent_contact = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recent_contact = RecentContact.get_all_contact();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: _content(),
        ));
  }

  Container _content() {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Recent Contacts",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily:
                          Theme.of(context).textTheme.displayLarge?.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 500,
              child: _displayContacts(),
            )
          ],
        ));
  }

  ListView _displayContacts() {
    return ListView.builder(
      itemCount: recent_contact.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubPage(
                        pageTitle: recent_contact[index].name,
                        pageInstance: ChatPage(),
                        color: Colors.pinkAccent
                    ),
                  ));
            },
            child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                Image.network(recent_contact[index].avatarUrl)
                                    .image,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                recent_contact[index].name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                recent_contact[index].message,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.call),
                    ])));
      },
      itemExtent: 80,
    );
  }
}
