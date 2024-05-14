import 'package:flutter/material.dart';
import 'package:third/Model/Contact.dart';

class HomePageClass extends StatefulWidget {
  @override
  State<HomePageClass> createState() => _HomePageClassState();
}

class _HomePageClassState extends State<HomePageClass> {
  var contacts = Contact.get_all_contact();
  late List<Contact> displayContacts;

  @override
  void initState() {
    displayContacts = contacts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            search_bar(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: displayContacts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(displayContacts[index].imagePath),
                        ),
                        title: Text(displayContacts[index].name),
                        subtitle: Text(displayContacts[index].email),
                        trailing: Icon(Icons.call),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 5,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget search_bar() {
    return TextField(
      onChanged: (value) {
        searchContact(value);
      },
      decoration: InputDecoration(
        hintText: 'Search',
        contentPadding: EdgeInsets.all(10),
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void searchContact(String query) {
    List<Contact> searchList = contacts
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      displayContacts = searchList;
    });
  }
}
