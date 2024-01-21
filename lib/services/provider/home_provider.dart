import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  final List<Map<String, dynamic>> _labTextList = [
    {
      "key": "611",
      "testName": "Thyroid Profile",
      "includes": 3,
      "currentAmount": 1000,
      "actualAmount": 1400,
    },
    {
      "key": "612",
      "testName": "Iron Study Test",
      "includes": 4,
      "currentAmount": 600,
      "actualAmount": 1000,
    },
    {
      "key": "613",
      "testName": "Thyroid Profile",
      "includes": 3,
      "currentAmount": 1000,
      "actualAmount": 1400,
    },
    {
      "key": "614",
      "testName": "Iron Study Test",
      "includes": 4,
      "currentAmount": 600,
      "actualAmount": 1000,
    },
  ];

  List<Map<String, dynamic>> get labTextList => _labTextList;
}
