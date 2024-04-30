import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final double scale;

  const RoundButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    this.scale = 0.8,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * scale,
      child: OutlinedButton(
        onPressed: () {
          press();
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.robotoSlab(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
