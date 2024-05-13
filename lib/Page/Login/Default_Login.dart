import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third/Component/RoundButton.dart';

import 'Login.dart';

class DefaultLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/remote-team.png",
                height: size.height * 0.38,
              ),
              Text(
                "Super Health",
                style: GoogleFonts.oleoScript(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RoundButton(
                text: "Login",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage()));
                },
                color: Colors.purple,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              RoundButton(
                text: "Sign Up",
                press: () {
                  Navigator.pushNamed(context, '/signup');
                },
                color: Colors.white,
                textColor: Colors.purple,
              ),
            ]),
      ),
    );
  }
}
