import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      setState(() {
        output = '0';
        num1 = 0;
        num2 = 0;
        operand = '';
      });
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '÷') {
      setState(() {
        num1 = double.parse(output);
        operand = buttonText;
        output = '0';
      });
    } else if (buttonText == '=') {
      setState(() {
        num2 = double.parse(output);
        if (operand == '+') {
          output = (num1 + num2).toString();
        }
        if (operand == '-') {
          output = (num1 - num2).toString();
        }
        if (operand == '×') {
          output = (num1 * num2).toString();
        }
        if (operand == '÷') {
          output = (num1 / num2).toString();
        }
        num1 = 0;
        num2 = 0;
        operand = '';
      });
    } else {
      setState(() {
        if (output == '0') {
          output = buttonText;
        } else {
          output += buttonText;
        }
      });
    }
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Text(
              output,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton('7', 1, Colors.grey),
                        buildButton('8', 1, Colors.grey),
                        buildButton('9', 1, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('4', 1, Colors.grey),
                        buildButton('5', 1, Colors.grey),
                        buildButton('6', 1, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('1', 1, Colors.grey),
                        buildButton('2', 1, Colors.grey),
                        buildButton('3', 1, Colors.grey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton('.', 1, Colors.grey),
                        buildButton('0', 1, Colors.grey),
                        buildButton('00', 1, Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [buildButton('C', 1, Colors.orange)]),
                    TableRow(children: [buildButton('÷', 1, Colors.orange)]),
                    TableRow(children: [buildButton('×', 1, Colors.orange)]),
                    TableRow(children: [buildButton('-', 1, Colors.orange)]),
                    TableRow(children: [buildButton('+', 1, Colors.orange)]),
                    TableRow(children: [buildButton('=', 2, Colors.orange)]),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
