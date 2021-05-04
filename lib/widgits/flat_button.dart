import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFlatButton extends StatelessWidget {
  final String text;
  final Color color;
  final txtColor;
  final Function callback;
  MyFlatButton(
      {this.text,
      this.color = Colors.teal,
      this.txtColor = Colors.white,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(4),
        height: 75,
        width: 75,
        child: TextButton(
            onPressed: () {
              callback(text);
            },
            child: Text(text,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(
                  color: txtColor,
                  fontSize: 26,
                ))),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: color,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(70)),
              ),
            )));
  }
}
