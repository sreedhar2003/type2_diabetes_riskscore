import 'package:flutter/material.dart';

class Type2DiabetesController with ChangeNotifier {
  bool isChecked = false;

  int? selectedIndex; // to store selected option

  List<String> ageOptions = [
    'Under 35',
    '35 - 44',
    '45 - 54',
    '55 - 64',
    '65+'
  ];

  final formKeys = GlobalKey<FormState>();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final TextEditingController waistController = TextEditingController();

  int? selectedIndex1;
  List<String> physicalactivityOptions = [
    'No',
    'Yes',
  ];

  int? selectedIndex2;
  List<String> dietOptions = [
    'No',
    'Yes',
  ];

  int? selectedIndex3;
  List<String> hypertensionoptions = [
    'No',
    'Yes',
    'Not Sure',
  ];

  int? selectedIndex4;
  List<String> threeoptions = [
    'No',
    'Yes',
    'Don’t Know',
  ];

  int? selectedIndex5;
}
