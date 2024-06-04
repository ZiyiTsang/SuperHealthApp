import 'package:flutter/material.dart';
import 'package:third/Model/Doctor.dart';

import '../../Component/WorkoutRow.dart';
import '../../Model/Appcolor.dart';
import 'Map.dart';

class ClinicPage extends StatefulWidget {
  @override
  _ClinicPageState createState() => _ClinicPageState();
}

class _ClinicPageState extends State<ClinicPage> {
  final doctorlist=Doctor.getDoctors();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: _content(context,doctorlist,media),
    );
  }
}

Column _content(context, doctorlist, media) {
  return Column(
    children: [
        EmbedMap(),
        doctorView(context,doctorlist,media),
      ],
    );
}

Container doctorView(context,doctorlist,media) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Doctors Around you",
          style: TextStyle(
              color: MyColors.blackColor,
              fontSize: 20,
              fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
              fontWeight: FontWeight.w700),
        ),],
    ),
        SizedBox(height: media.height * 0.005),
        ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: doctorlist.length,
        itemBuilder: (context, index) {
          var wObj = doctorlist[index];
          return DoctorRow(wObj: wObj);
        }),
  ]));
}


