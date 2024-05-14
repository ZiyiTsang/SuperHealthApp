import 'package:flutter/material.dart';
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
  List<RecentContact> recent_contact = RecentContact.getRecentContact();
  late List<RecentContact> displayContacts;
  bool _displaySearch = false;
  @override
  void initState() {
    super.initState();
    displayContacts = recent_contact;
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
                  GestureDetector(
                    child: Icon(
                      _displaySearch ? Icons.close : Icons.search,
                      size: 30,
                    ),
                    onTap: () {
                      setState(() {
                        _displaySearch = !_displaySearch;
                        displayContacts = recent_contact;
                      });
                    },
                  )
                ],
              ),
            ),
            _displaySearch
                ? Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setState(() {
                          displayContacts = recent_contact
                              .where((element) => element.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  )
                : Container(),
            Expanded(
              child: _displayContacts(),
            )
          ],
        ));
  }

  ListView _displayContacts() {
    return ListView.builder(
      itemCount: displayContacts.length,
      itemBuilder: (context, index) {
          var dot=Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
            color: displayContacts[index].status == 'online'
                ? Colors.green
                : Colors.grey,
            borderRadius: BorderRadius.circular(5),
            ),
          );

        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 9,
                child: GestureDetector(
                  child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                        backgroundImage:
                            getImage(displayContacts[index].avatarUrl),
                      ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                            displayContacts[index].name.length > 18
                                ? displayContacts[index].name.substring(0, 18) +
                                    '...'
                                : displayContacts[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              ),
                            overflow: TextOverflow.ellipsis,
                          ),
                            Text(
                            displayContacts[index].message.length > 25
                                ? displayContacts[index]
                                        .message
                                        .substring(0, 25) +
                                    '...'
                                : displayContacts[index].message,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                                color: Colors.black87,
                              ),
                            overflow: TextOverflow.ellipsis,
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
                          pageTitle: displayContacts[index].name,
                          pageInstance: ChatPage(),
                          color: Colors.pinkAccent,
                        ),
                      ),
                    );
                  },
                  ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubPage(
                              pageTitle: displayContacts[index].name,
                              pageInstance: ContactDetail(
                                person: getUserById(displayContacts[index].id),
                              ),
                              color: Colors.pinkAccent,
                            ),
                          ),
                        );
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
                      child:
                          Icon(Icons.call, size: 30, color: Colors.pinkAccent),
                    ),
                      SizedBox(
                        width: 5,
                      ),
                      dot,
                    ],
                ),
              )
            ],
          ),
        );
      },
      itemExtent: 80,
    );
  }

}
