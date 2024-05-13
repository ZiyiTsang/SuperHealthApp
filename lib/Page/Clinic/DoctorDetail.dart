import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:third/Utils/Func.dart';

import '../../Model/Doctor.dart';

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

class DoctorDetailPage extends StatefulWidget {
  final Doctor wObj;

  const DoctorDetailPage({super.key, required this.wObj});

  @override
  _DoctorDetailPageState createState() => _DoctorDetailPageState(wObj: wObj);
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  final Doctor wObj;

  _DoctorDetailPageState({required this.wObj});

  late DateTime _selectedDay = DateTime.now();
  late DateTime _focusedDay = DateTime.now();

  late CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: getImage(wObj.image.toString()),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        '${wObj.name}',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${wObj.speciality}",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  "Check Available Date",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  padding: EdgeInsets.all(size.width * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay =
                            focusedDay; // update `_focusedDay` here as well
                      });
                    },
                    eventLoader: (day) {
                      if (day.weekday == DateTime.monday ||
                          day.weekday == DateTime.wednesday ||
                          day.weekday == DateTime.friday) {
                        return [Event('Cyclic event')];
                      }
                      return [];
                    },
                  ),
                )
              ])),
    );
  }
}
