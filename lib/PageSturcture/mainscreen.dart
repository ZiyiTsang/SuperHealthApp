import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third/Page/Home/home_lecture.dart';
import 'package:third/Page/Notification/notification.dart';
import 'package:third/Page/Setting/setting.dart';
import '../Page/Message/Contacts.dart';

class mainScreen extends StatefulWidget {
  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int _currentPageIndex = 0;
  List<String> _pageTitles = ['Home', 'Notifications', 'Messages', 'More'];
  List<Color> _theme_colors = [
    Colors.blue,
    Colors.yellow,
    Colors.pinkAccent,
    Colors.green
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
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
        HomePage(),
        NotificationPage(),
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
            icon:
                Badge(label: Text('2'), child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
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
