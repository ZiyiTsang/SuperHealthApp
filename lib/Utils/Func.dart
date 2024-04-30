import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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