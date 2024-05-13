import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third/Model/Appcolor.dart';
import 'package:third/Page/News/NewsPage.dart';
import 'package:third/Page/Setting/ProfileDetail.dart';
import 'package:third/PageSturcture/subPage.dart';
import 'package:third/Utils/SharePref.dart';

import '../../Utils/Func.dart';
import '../Login/Default_Login.dart';
import 'Policy.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _chat_Message = true;
  bool _system_information = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      padding: EdgeInsets.only(top: 10),
      child: _content(context),
    );
  }

  Container _content(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: _realContent(context),
    );
  }

  SingleChildScrollView _realContent(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            profileCard(context, media),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Notification",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.fontFamily)),
                    SizedBox(height: media.width * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.notifications_active_outlined),
                            SizedBox(width: media.width * 0.02),
                            Text("Chat Message",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontFamily)),
                          ],
                        ),
                        CupertinoSwitch(
                          value: _chat_Message,
                          onChanged: (value) {
                            setState(() {
                              _chat_Message = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: media.width * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.notifications_outlined),
                            SizedBox(width: media.width * 0.02),
                            Text("System Information",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontFamily)),
                          ],
                        ),
                        CupertinoSwitch(
                          value: _system_information,
                          onChanged: (value) {
                            setState(() {
                              _system_information = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: media.width * 0.03,
            ),
            Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Support",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.fontFamily)),
                    SizedBox(height: media.width * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.document_scanner_outlined),
                            SizedBox(width: media.width * 0.02),
                            Text("Privacy Policy",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontFamily)),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SubPage(
                                        pageTitle: "Privacy Policy",
                                        pageInstance: PolicyPage(),
                                        color: Colors.green),
                                  ));
                            },
                            icon: Icon(Icons.arrow_forward_ios_outlined)),
                      ],
                    ),
                    SizedBox(height: media.width * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.email_outlined),
                            SizedBox(width: media.width * 0.02),
                            Text("Contact Us",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontFamily)),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog_custom(context, "Contact Us",
                                  "Email:CME1909120@xmu.edu.my");
                            },
                            icon: Icon(Icons.arrow_forward_ios_outlined)),
                      ],
                    ),
                    SizedBox(height: media.width * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.app_shortcut_outlined),
                            SizedBox(width: media.width * 0.02),
                            Text("Check Update",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontFamily)),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog_custom(context, "App Version",
                                  "Your application is up to date!");
                            },
                            icon: Icon(Icons.arrow_forward_ios_outlined)),
                      ],
                    ),
                    SizedBox(height: media.width * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.library_books_outlined),
                            SizedBox(width: media.width * 0.02),
                            Text("Health News",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontFamily)),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SubPage(
                                        pageTitle: "Health News",
                                        pageInstance: NewsPage(),
                                        color: Colors.green),
                                  ));
                            },
                            icon: Icon(Icons.arrow_forward_ios_outlined)),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: media.width * 0.03,
            ),
            //logout
            Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: InkWell(
                  onTap: () {
                    SharedPreferencesHelper().setLogin(false);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DefaultLogin(),
                        ),
                        (route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: media.width * 0.02),
                      Text("Logout",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              fontWeight: FontWeight.normal,
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.fontFamily)),
                    ],
                  ),
                )),

            // GestureDetector(
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Text('上课2',
            //           style: TextStyle(
            //               fontSize: 25,
            //               fontWeight: FontWeight.bold,
            //               fontFamily: 'Roboto')),
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               SubPage(pageTitle: "666",
            //                   pageInstance: classPage2(),
            //                   color: Colors.blue),
            //         ));
            //   },
            // ),
            // GestureDetector(
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Text('Network',
            //           style: TextStyle(
            //               fontSize: 25,
            //               fontWeight: FontWeight.bold,
            //               fontFamily: 'Roboto')),
            //     ),
            //   ),
            //   onTap: () {
            //     NetworkUtils().try_network().then((value) {
            //       showNetworkStatusDialog(context, value);
            //     });
            //   },
            // ),
            // GestureDetector(
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Text('上课3',
            //           style: TextStyle(
            //               fontSize: 25,
            //               fontWeight: FontWeight.bold,
            //               fontFamily: 'Roboto')),
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               SubPage(pageTitle: "Class",
            //                   pageInstance: classPage3(),
            //                   color: Colors.green),
            //         ));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

GestureDetector profileCard(Context, Size media) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          Context,
          MaterialPageRoute(
            builder: (Context) => SubPage(
                pageTitle: "Account",
                pageInstance: ProfileDetailPage(),
                color: Colors.green),
          ));
    },
    child: Container(
      padding: EdgeInsets.all(media.width * 0.06),
      height: media.width * 0.4,
      decoration: BoxDecoration(
          color: MyColors.primaryColor1.withOpacity(0.05),
          borderRadius: BorderRadius.circular(media.width * 0.065)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("John Doe",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily:
                            Theme.of(Context).textTheme.bodyLarge?.fontFamily)),
                SizedBox(height: media.width * 0.02),
                Divider(
                  color: Colors.black87,
                  height: 10,
                  thickness: 10,
                  indent: 0,
                  endIndent: 0,
                ),
                Text("Email:123456@qq.com",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontFamily:
                            Theme.of(Context).textTheme.bodyLarge?.fontFamily)),
                Text("Ip Address: Malaysia",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontFamily:
                            Theme.of(Context).textTheme.bodyLarge?.fontFamily)),
              ]),
          CircleAvatar(
            radius: 50,
            backgroundImage: Image.network(
                    "https://th.bing.com/th?id=OIP.plN1OWIkI9w5kqGCso6Z-AHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2")
                .image,
          ),
        ],
      ),
    ),
  );
}
