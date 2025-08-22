import 'package:flutter/material.dart';

class Type2DiabetesController with ChangeNotifier {
  bool isChecked = false;

  // Step 1: Age
  int? selectedIndex;
  List<String> ageOptions = ['Under 35', '35-44', '45-54', '55-64', '65+'];

  void selectAge(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  // Step 2: BMI (Height and Weight)
  final formKeys = GlobalKey<FormState>();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  // Step 3: Waist Circumference
  final formKey = GlobalKey<FormState>();
  final TextEditingController waistController = TextEditingController();

  // Gender selection (needed for waist circumference calculation)
  String? selectedGender;
  List<String> genderOptions = ['Male', 'Female'];

  void selectGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  // Step 4: Physical Activity
  int? selectedIndex1;
  List<String> physicalactivityOptions = [
    'No',
    'Yes',
  ];

  // Step 5: Daily Diet
  int? selectedIndex2;
  List<String> dietOptions = [
    'No',
    'Yes',
  ];

  // Step 6: Hypertension History
  int? selectedIndex3;
  List<String> hypertensionoptions = [
    'No',
    'Yes',
    'Not Sure',
  ];

  // Step 7: Blood Sugar History
  int? selectedIndex4;
  List<String> threeoptions = [
    'No',
    'Yes',
    'Don\'t Know',
  ];

  // Step 8: Family History
  int? selectedIndex5;

  // Calculate BMI
  double calculateBMI() {
    if (heightController.text.isEmpty || weightController.text.isEmpty) {
      return 0.0;
    }

    double heightCm = double.tryParse(heightController.text) ?? 0.0;
    double weightKg = double.tryParse(weightController.text) ?? 0.0;

    if (heightCm == 0 || weightKg == 0) return 0.0;

    double heightM = heightCm / 100;
    return weightKg / (heightM * heightM);
  }

  // Calculate total risk score
  Map<String, dynamic> calculateRisk() {
    int score = 0;

    // 1. Age points
    if (selectedIndex != null) {
      switch (selectedIndex) {
        case 0:
          score += 0;
          break; // Under 35
        case 1:
          score += 2;
          break; // 35-44
        case 2:
          score += 4;
          break; // 45-54
        case 3:
          score += 6;
          break; // 55-64
        case 4:
          score += 8;
          break; // 65+
      }
    }

    // 2. BMI points
    double bmi = calculateBMI();
    if (bmi < 25) {
      score += 0;
    } else if (bmi <= 30) {
      score += 3;
    } else {
      score += 5;
    }

    // 3. Waist circumference points
    double waistCm = double.tryParse(waistController.text) ?? 0.0;
    if (selectedGender != null && waistCm > 0) {
      if (selectedGender!.toLowerCase() == 'male') {
        if (waistCm < 94)
          score += 0;
        else if (waistCm <= 102)
          score += 3;
        else
          score += 4;
      } else {
        if (waistCm < 80)
          score += 0;
        else if (waistCm <= 88)
          score += 3;
        else
          score += 4;
      }
    }

    // 4. Physical activity points
    if (selectedIndex1 != null) {
      score += selectedIndex1 == 1 ? 0 : 2; // Yes=1, No=0
    }

    // 5. Daily diet points
    if (selectedIndex2 != null) {
      score += selectedIndex2 == 1 ? 0 : 1; // Yes=1, No=0
    }

    // 6. Hypertension history points
    if (selectedIndex3 != null) {
      switch (selectedIndex3) {
        case 0:
          score += 0;
          break; // No
        case 1:
          score += 2;
          break; // Yes
        case 2:
          score += 1;
          break; // Not Sure
      }
    }

    // 7. Blood sugar history points
    if (selectedIndex4 != null) {
      switch (selectedIndex4) {
        case 0:
          score += 0;
          break; // No
        case 1:
          score += 5;
          break; // Yes
        case 2:
          score += 2;
          break; // Don't Know
      }
    }

    // 8. Family history points
    if (selectedIndex5 != null) {
      switch (selectedIndex5) {
        case 0:
          score += 0;
          break; // No
        case 1:
          score += 5;
          break; // Yes
        case 2:
          score += 3;
          break; // Don't Know
      }
    }

    // Map score to risk category
    String riskCategory;
    double riskPercent;

    if (score <= 6) {
      riskCategory = "Low";
      riskPercent = 1;
    } else if (score <= 11) {
      riskCategory = "Slightly Elevated";
      riskPercent = 4;
    } else if (score <= 14) {
      riskCategory = "Moderate";
      riskPercent = 17;
    } else if (score <= 20) {
      riskCategory = "High";
      riskPercent = 33;
    } else {
      riskCategory = "Very High";
      riskPercent = 50;
    }

    return {
      "score": score,
      "riskCategory": riskCategory,
      "riskPercent": riskPercent,
    };
  }

  void resetCalculator() {
    selectedIndex = null;
    selectedIndex1 = null;
    selectedIndex2 = null;
    selectedIndex3 = null;
    selectedIndex4 = null;
    selectedIndex5 = null;
    selectedGender = null;
    heightController.clear();
    weightController.clear();
    waistController.clear();
    notifyListeners();
  }
}

// import 'package:flutter/material.dart';

// class Type2DiabetesController with ChangeNotifier {
//   bool isChecked = false;
//   int? selectedIndex;
//   List<String> ageOptions = ['Under 35', '35-44', '45-54', '55-64', '65+'];

//   void selectAge(int index) {
//     selectedIndex = index;
//     notifyListeners();
//   }

//   final formKeys = GlobalKey<FormState>();
//   final TextEditingController heightController = TextEditingController();
//   final TextEditingController weightController = TextEditingController();

//   final formKey = GlobalKey<FormState>();
//   final TextEditingController waistController = TextEditingController();

//   int? selectedIndex1;
//   List<String> physicalactivityOptions = [
//     'No',
//     'Yes',
//   ];

//   int? selectedIndex2;
//   List<String> dietOptions = [
//     'No',
//     'Yes',
//   ];

//   int? selectedIndex3;
//   List<String> hypertensionoptions = [
//     'No',
//     'Yes',
//     'Not Sure',
//   ];

//   int? selectedIndex4;
//   List<String> threeoptions = [
//     'No',
//     'Yes',
//     'Don’t Know',
//   ];

//   int? selectedIndex5;
// }
