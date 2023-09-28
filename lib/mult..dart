// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late int number;
  late int doubleResult;
  late int multiplyResult;

  void calculateDouble() {
    setState(() {
      doubleResult = number * 2;
    });
  }

  void calculateMultiply() {
    setState(() {
      multiplyResult = number * number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                number = int.parse(value);
              });
            },
            decoration: InputDecoration(labelText: 'الرقم المدخل'),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: calculateDouble,
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                ),
                child: Text('مضاعف'),
              ),
              SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: calculateMultiply,
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                ),
                child: Text('مضروب'),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Text(doubleResult != null ? 'مضاعف الرقم: $doubleResult' : ''),
          SizedBox(height: 10.0),
          Text(multiplyResult != null ? 'مضروب الرقم: $multiplyResult' : ''),
        ],
      ),
    );
  }
}
