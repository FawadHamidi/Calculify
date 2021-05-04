import 'package:calculify/widgits/flat_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _expression = "";
  String _history = "";

  void onClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = "";
      _history = "";
    });
  }

  void clear(String text) {
    setState(() {
      _expression = "";
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel contextModel = ContextModel();
    var eval = exp.evaluate(EvaluationType.REAL, contextModel);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 6, right: 24),
            child: Text(
              _history,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                fontSize: 22,
                color: Colors.white12,
              )),
            ),
            alignment: Alignment(1, 1),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 6, right: 24),
            child: Text(
              _expression,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                fontSize: 50,
                color: Colors.white,
              )),
            ),
            alignment: Alignment(1, 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyFlatButton(
                  text: 'AC',
                  color: Colors.amber,
                  callback: allClear,
                ),
                MyFlatButton(
                  text: 'C',
                  color: Colors.teal.shade50,
                  txtColor: Colors.teal,
                  callback: clear,
                ),
                MyFlatButton(
                  text: '%',
                  color: Colors.teal.shade50,
                  txtColor: Colors.teal,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '/',
                  color: Colors.teal.shade50,
                  txtColor: Colors.teal,
                  callback: onClick,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyFlatButton(
                  text: '7',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '8',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '9',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '*',
                  color: Colors.teal.shade50,
                  txtColor: Colors.teal,
                  callback: onClick,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyFlatButton(
                  text: '4',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '5',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '6',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '-',
                  color: Colors.teal.shade50,
                  txtColor: Colors.teal,
                  callback: onClick,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyFlatButton(
                  text: '1',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '2',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '3',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '+',
                  color: Colors.teal.shade50,
                  txtColor: Colors.teal,
                  callback: onClick,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyFlatButton(
                  text: '.',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '0',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '00',
                  color: Colors.white12,
                  callback: onClick,
                ),
                MyFlatButton(
                  text: '=',
                  color: Colors.teal.shade50,
                  txtColor: Colors.teal,
                  callback: evaluate,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
