import '../constant/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDesc;

  BmiCalculator({this.height, this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    // this.bmi = bmi;
  }

  double calculateBmi() {
    double heightInMeter;
    heightInMeter = height! / 100;
    bmi = weight! / (heightInMeter * heightInMeter);
    // print('bmi result is: ');
    // print(bmi);
    return bmi!;
  }

  String determinanceCategory() {
    // String bmiCategory = "";
    if (bmi! < 16.0) {
      bmiCategory = underWeightSevere;
    } else if (bmi! >= 16.0 && bmi! <= 17) {
      bmiCategory = underWeightModerate;
    } else if (bmi! >= 17.0 && bmi! <= 18.5) {
      bmiCategory = underWeightMild;
    } else if (bmi! >= 18.5 && bmi! <= 25) {
      bmiCategory = normal;
    } else if (bmi! >= 25 && bmi! <= 30) {
      bmiCategory = overWeight;
    } else if (bmi! >= 30 && bmi! <= 35) {
      bmiCategory = obeseI;
    } else if (bmi! >= 35.0 && bmi! <= 40) {
      bmiCategory = obeseII;
    } else if (bmi! > 40.0) {
      bmiCategory = obeseIII;
    }

    return bmiCategory!;
  }

  getRiskDescription() {
    // String bmiDesc = "";
    switch (bmiCategory) {
      case underWeightSevere:
      case underWeightModerate:
      case underWeightMild:
        bmiDesc = "Possible Nutritional deficiency and osteoporosis";
        break;
      case normal:
        bmiDesc = "Low Risk (Health Range)";
        break;
      case overWeight:
        bmiDesc =
            "Moderate Risk of developing hearth desease, high blood preasure, stroke, diabetes, mellitus";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        bmiDesc =
            "High Risk of developing hearth desease, high blood preasure, stroke, diabetes, mellitus, metabolic syndrome";
        break;
      default:
    }
    return bmiDesc!;
  }
}
