import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:third/Utils/Func.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Model/Recent_contact.dart';
import '../../PageSturcture/subPage.dart';
import 'Chat.dart';
import 'ContactDetail.dart';

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
    recent_contact = RecentContact.getRecentContact();
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
          var dot=Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: recent_contact[index].status == 'online' ? Colors.green : Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          );


        return Container(
            padding: EdgeInsets.all(5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              getImage(recent_contact[index].avatarUrl),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              recent_contact[index].name.length > 18
                                  ? recent_contact[index].name.substring(0, 18) + '...'
                                  : recent_contact[index].name,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              recent_contact[index].message.length > 25
                                  ? recent_contact[index].message.substring(0, 25) + '...'
                                  : recent_contact[index].message,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubPage(
                                    pageTitle: recent_contact[index].name,
                                    pageInstance: ChatPage(),
                                    color: Colors.pinkAccent,
                                  )));
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //小绿点，显示在线
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubPage(
                                    pageTitle: recent_contact[index].name,
                                    pageInstance: ContactDetail(
                                      person:
                                          getUserById(recent_contact[index].id),
                                    ),
                                    color: Colors.pinkAccent),
                              ));
                        },
                        child: Icon(
                          Icons.medical_information_rounded,
                          size: 30,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          launch("tel://214324234");
                        },
                        child: Icon(Icons.call,
                            size: 30, color: Colors.pinkAccent),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      dot,
                    ],
                  )
                ]));
      },
      itemExtent: 80,
    );
  }

}
