
import 'package:flutter/material.dart';

import '../../Component/NotificationRow.dart';

class NotificationScreen extends StatefulWidget {
  static String routeName = "/NotificationScreen";

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List notificationArr = [
    {
      "image": "assets/images/Workout/1.jpg",
      "title": "Boost Your Energy with a Quick Snack",
      "time": "Just Now"
    },
    {
      "image": "assets/images/Workout/2.jpg",
      "title": "Get Ready for Leg Day!",
      "time": "2 Hours Ago"
    },
    {
      "image": "assets/images/Workout/3.jpg",
      "title": "Healthy Meal Ideas for Busy Days",
      "time": "About 3 hours ago"
    },
    {
      "image": "assets/images/Workout/4.jpg",
      "title": "Celebrate Your Fitness Milestone",
      "time": "29 May"
    },
    {
      "image": "assets/images/Workout/5.jpg",
      "title": "Fuel Your Body Right - Lunch Time Reminder",
      "time": "15 April"
    },
    {
      "image": "assets/images/Workout/6.jpg",
      "title": "Ups, You have missed your Lowerbo...",
      "time": "8 April"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        itemBuilder: ((context, index) {
          var nObj = notificationArr[index] as Map? ?? {};
          return NotificationRow(nObj: nObj);
        }),
        separatorBuilder: (context, index) {
          return SizedBox(height: 5);
        },
        itemCount: notificationArr.length);
  }
}
