// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:bmi/helper/bmi_calculator.dart';
import 'package:bmi/view/bmi_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi/constant/constant.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    super.key,
    required this.bmiResult,
    // this.bmiCalculator
  });
  final double bmiResult;
  // final BmiCalculator? bmiCalculator;

  // String determinanceCategory(double bmi) {
  //   String category = "";
  //   if (bmi < 16.0) {
  //     category = underWeightSevere;
  //   } else if (bmi >= 16.0 && bmi <= 17) {
  //     category = underWeightModerate;
  //   } else if (bmi >= 17.0 && bmi <= 18.5) {
  //     category = underWeightMild;
  //   } else if (bmi >= 18.5 && bmi <= 25) {
  //     category = normal;
  //   } else if (bmi >= 25 && bmi <= 30) {
  //     category = overWeight;
  //   } else if (bmi >= 30 && bmi <= 35) {
  //     category = obeseI;
  //   } else if (bmi >= 35.0 && bmi <= 40) {
  //     category = obeseII;
  //   } else if (bmi > 40.0) {
  //     category = obeseIII;
  //   }

  //   return category;
  // }

  // getRiskDescription(String categoryName) {
  //   String desc = "";
  //   switch (categoryName) {
  //     case underWeightSevere:
  //     case underWeightModerate:
  //     case underWeightMild:
  //       desc = "Possible Nutritional deficiency and osteoporosis";
  //       break;
  //     case normal:
  //       desc = "Low Risk (Health Range)";
  //       break;
  //     case overWeight:
  //       desc =
  //           "Moderate Risk of developing hearth desease, high blood preasure, stroke, diabetes, mellitus";
  //       break;
  //     case obeseI:
  //     case obeseII:
  //     case obeseIII:
  //       desc =
  //           "High Risk of developing hearth desease, high blood preasure, stroke, diabetes, mellitus, metabolic syndrome";
  //       break;
  //     default:
  //   }
  //   return desc;
  // }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmiResult);
    bmiCalculator.determinanceCategory();
    bmiCalculator.getRiskDescription();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Result BMI",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Column(children: [
        const Expanded(
          // color: Colors.lightBlue,
          child: Text(
            "Your Result: ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
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
                        bmiCalculator.bmiCategory!,
                        // atau menggunakan bmiCalculator.bmiCategory ??,

                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiCalculator.bmi!.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Center(
                        child: Text(
                          bmiCalculator.bmiDesc!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
            color: buttonColor,
            height: 60,
            child: const Center(
                child: Text(
              "Re Calculate BMI",
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
