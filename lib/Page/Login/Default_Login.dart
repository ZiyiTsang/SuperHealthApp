import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:third/Component/RoundButton.dart';

class DefaultLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            SvgPicture.asset(
              "assets/images/remote-team.svg",
              height: size.height * 0.35,
            ),
            Text(
              "Welcome to Ziyi App",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            RoundButton(
              text: "Login",
              press: () {
                print(666);
              },
              color: Colors.purple,
              textColor: Colors.white,
            ),
            RoundButton(
              text: "Sign Up",
              press: () {
                print(666);
              },
              color: Colors.white,
              textColor: Colors.purple,
            ),
      ]),
    );
  }
}
