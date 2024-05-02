import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/Contact.dart';

void showNetworkStatusDialog(BuildContext context, bool isAvailable) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Network"),
        content: Text(isAvailable ? "Network is available" : "Network is not available"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
void showDialog_custom(BuildContext context, String title,String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    ),
  );

}
Contact getUserById(int id) {
  Map<int, Contact> contact_map=Contact.getContactDatabase();
  return contact_map[id]!;
}

ImageProvider getImage(String url) {
  print(url);
  if (url.startsWith('http://') || url.startsWith('https://')){
    print(1234);
    return Image.network(url).image;
  }
  return Image.asset(url).image;
}
