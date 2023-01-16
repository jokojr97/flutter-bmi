// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:bmi/view/bmi_data_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bmi/constant/constant.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({super.key, required this.bmiResult});
  final double bmiResult;

  String determinanceCategory(double bmi) {
    String category = "";
    if (bmi < 16.0) {
      category = underWeightSevere;
    } else if (bmi >= 16.0 && bmi <= 17) {
      category = underWeightModerate;
    } else if (bmi >= 17.0 && bmi <= 18.5) {
      category = underWeightMild;
    } else if (bmi >= 18.5 && bmi <= 25) {
      category = normal;
    } else if (bmi >= 25 && bmi <= 30) {
      category = overWeight;
    } else if (bmi >= 30 && bmi <= 35) {
      category = ObeseI;
    } else if (bmi >= 35.0 && bmi <= 40) {
      category = ObeseII;
    } else if (bmi > 40.0) {
      category = ObeseIII;
    }

    return category;
  }

  getRiskDescription(String categoryName) {
    String desc = "";
    switch (categoryName) {
      case underWeightSevere:
        desc = "Possible Nutritional deficiency and osteoporosis";
        break;
      case underWeightModerate:
        desc = "Possible Nutritional deficiency and osteoporosis";
        break;
      case underWeightMild:
        desc = "Possible Nutritional deficiency and osteoporosis";
        break;
      case normal:
        desc = "Low Risk (Health Range)";
        break;
      case overWeight:
        desc =
            "Moderate Risk of developing hearth desease, high blood preasure, stroke, diabetes, mellitus";
        break;
      case ObeseI:
        desc =
            "High Risk of developing hearth desease, high blood preasure, stroke, diabetes, mellitus, metabolic syndrome";
        break;
      case ObeseII:
        desc =
            "High Risk of developing hearth desease, high blood preasure, stroke, diabetes, mellitus, metabolic syndrome";
        break;
      case ObeseIII:
        desc =
            "High Risk of developing hearth desease, high blood preasure, stroke, diabetes, mellitus, metabolic syndrome";
        break;
      default:
    }
    return desc;
  }

  @override
  Widget build(BuildContext context) {
    final categoryName = determinanceCategory(bmiResult);
    final riskName = getRiskDescription(categoryName);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Result BMI",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          // color: Colors.lightBlue,
          child: Container(
            // margin: EdgeInsets.only(top: 10, bottom: 15),
            child: const Text(
              "Your Result: ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
            flex: 5,
            child: BmiCard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "$categoryName",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${bmiResult.toStringAsFixed(1)}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Center(
                        child: Text(
                          "$riskName",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ]),
              ),
            )),
        GestureDetector(
          onTap: () => {Navigator.pop(context)},
          child: Container(
            color: ButtonColor,
            height: 60,
            child: const Center(
                child: Text(
              "Hitung Ulang BMI",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )),
          ),
        )
      ]),
    );
  }
}
