import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third/Component/RoundButton.dart';
import 'package:third/Utils/SharePref.dart';

import '../../PageSturcture/mainscreen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(10),
          width: size.width,
          height: size.height,
          child: Column(children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Image.asset(
              "assets/images/crowdfunding.png",
              height: size.height * 0.38,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.85,
              child: TextField(
                showCursor: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: const Icon(Icons.email_rounded),
                  hintText: "Email",
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
            Container(
              width: size.width * 0.85,
              child: TextField(
                showCursor: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: const Icon(Icons.password_rounded),
                  hintText: "Password",
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            RoundButton(
                text: 'Login',
                press: () {
                  SharedPreferencesHelper().setLogin(true);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => mainScreen()),
                    (Route<dynamic> route) => false

                  );
                },
                color: Colors.purple,
                textColor: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    )
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ])),
    ));
  }
}
