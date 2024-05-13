import 'package:flutter/material.dart';
import 'package:third/Page/Class/accommodation.dart';
import 'package:third/Page/Class/food_page.dart';
import 'package:third/Page/Class/travel_page.dart';

import '../../Component/NavBarDrawer.dart';
import 'cluise.dart';

class Homepage_class extends StatefulWidget {
  @override
  State<Homepage_class> createState() => _homepage_classState();
}

class _homepage_classState extends State<Homepage_class> {
  int _currentPageIndex = 0;
  List _pages = [
    TravelPage(),
    FoodPage(),
    AccommodationPage(),
    cruise(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _pages[_currentPageIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 7,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            fixedColor: Colors.black54,
            currentIndex: _currentPageIndex,
            onTap: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black54,
                ),
                label: 'Travel',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.medical_services, color: Colors.black54),
                label: 'Food',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.hotel, color: Colors.black54),
                label: 'Accommodation',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.face_unlock_outlined, color: Colors.black54),
                label: 'Cruise',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
