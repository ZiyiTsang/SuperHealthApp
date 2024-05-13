import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third/Page/Clinic/Clinic.dart';
import 'package:third/Page/Home/HomeScreen.dart';
import 'package:third/Page/Setting/Setting.dart';
import 'package:third/PageSturcture/subPage.dart';

import '../Page/Message/Contacts.dart';
import '../Page/Other/notification.dart';

class mainScreen extends StatefulWidget {
  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int _currentPageIndex = 0;
  List<String> _pageTitles = ['Home', 'Doctor', 'Message', 'More'];
  List<Color> _theme_colors = [
    Colors.blue,
    Colors.purple,
    Colors.pinkAccent,
    Colors.green
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [

          IconButton(
            icon: Badge(child: Icon(Icons.notifications_active_rounded, color: Colors.white,size: 30,),),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubPage(
                        pageTitle: 'Notification',
                        pageInstance: NotificationScreen(),
                        color: Colors.green)),
              );
            },

          ),],
        centerTitle: true,
        title: Text(_pageTitles[_currentPageIndex],
            style: GoogleFonts.courgette(
              textStyle: (TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
            )),
        backgroundColor: this._theme_colors[_currentPageIndex],
      ),
      body: <Widget>[
        HomeScreen(),
        ClinicPage(),
        Contacts(),
        Setting(),
      ].elementAt(_currentPageIndex),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        animationDuration: const Duration(milliseconds: 100),
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        indicatorColor: this._theme_colors[_currentPageIndex],

        selectedIndex: _currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.accessibility_new),
            label: 'Doctor',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_rounded),
            ),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
