import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("John Doe",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            accountEmail: Text("1234@qq.com",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            currentAccountPicture: ClipOval(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/ProfileImage/1.jpg"),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Contact'),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => SubPage(
              //             pageTitle: 'Profile_Page',
              //             pageInstance: ProfileCard(),
              //             color: Colors.green)));
            },
          ),
        ],
      ),
    );
  }
}
