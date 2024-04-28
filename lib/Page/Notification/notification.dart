
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _notificationPageState createState() => _notificationPageState();
}

class _notificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Notification Page'),
    );
  }
}