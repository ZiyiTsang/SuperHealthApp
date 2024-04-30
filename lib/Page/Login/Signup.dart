import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_validator/form_validator.dart';

import '../../Component/RoundButton.dart';
import '../../PageSturcture/mainscreen.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<SignupPage> {
  int currentStep = 0;
  Container currentPage= Container();
  final validate_email = ValidationBuilder().email().build();
  final validate_OPT= ValidationBuilder().minLength(6).maxLength(6).build();
  TextEditingController _Controller = TextEditingController();
  TextEditingController _Controller_2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    switch (currentStep) {
      case 0:
        currentPage= emailPage(context);
      case 1:
        currentPage= otpPage(context);
      case 2:
        currentPage= passwordPage(context);
      default:
        currentPage= emailPage(context);
    }
    return Scaffold(
        body: SingleChildScrollView(
      child: currentPage,
    ));
  }

  Container emailPage(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(10),
        width: size.width,
        height: size.height,
        child: Column(children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Image.asset(
            "assets/images/support-team.png",
            height: size.height * 0.38,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.85,
            child: TextField(
              controller: _Controller,
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
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundButton(
              text: 'Send OTP',
              press: () {
                String? text=validate_email(_Controller.text);
                if (text == null) {
                  setState(() {
                    currentStep += 1;
                    _Controller.clear();
                  });
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(text),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              color: Colors.purple,
              textColor: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  )
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
  Container otpPage(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(10),
        width: size.width,
        height: size.height,
        child: Column(children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Image.asset(
            "assets/images/support-team.png",
            height: size.height * 0.38,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.85,
            child: TextField(
              controller: _Controller,
              showCursor: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: const Icon(Icons.text_fields_rounded),
                hintText: "OTP",
                labelText: "OTP",
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
              text: 'Verify OTP',
              press: () {
                String? text=validate_OPT(_Controller.text);
                if (text == null) {
                  setState(() {
                    currentStep += 1;
                    _Controller.clear();
                  });
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(text),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              color: Colors.purple,
              textColor: Colors.white),
        ]));
  }
  Container passwordPage(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(10),
        width: size.width,
        height: size.height,
        child: Column(children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Image.asset(
            "assets/images/support-team.png",
            height: size.height * 0.38,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.85,
            child: Column(
              children: [
                TextField(
                  controller: _Controller,
                  showCursor: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: const Icon(Icons.text_fields_rounded),
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
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  controller: _Controller_2,
                  showCursor: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    prefixIcon: const Icon(Icons.text_fields_rounded),
                    hintText: "ReEnter Password",
                    labelText: "ReEnter Password",
                    labelStyle: TextStyle(
                      color: Colors.black87,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black26,
                    ),
                  ),
                ),
              ]
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundButton(
              text: 'Registrar',
              press: () {
                if (_Controller.text == _Controller_2.text) {
                  Fluttertoast.showToast(msg: 'Registration successful, please Login!');
                  Navigator.pushReplacementNamed(
                      context,
                      '/login');
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Passwords do not match"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              color: Colors.purple,
              textColor: Colors.white),

        ]));
  }

}
