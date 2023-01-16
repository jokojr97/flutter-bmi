// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:bmi/constant/constant.dart';
import 'package:bmi/view/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 150;
  int weight = 60;
  int age = 25;

  double calculateBMI() {
    double hasilBmi;
    double heightInMeter;
    heightInMeter = height / 100;
    hasilBmi = weight / (heightInMeter * heightInMeter);
    return hasilBmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: const Center(child: Text("BMI Calculator")),
      ),
      body: Column(children: [
        Expanded(
            child: Row(
          children: const [
            Expanded(
                child: BmiCard(
              child: GenderIconText(
                title: "Male",
                icon: Icons.male,
                color: Colors.blue,
              ),
            )),
            Expanded(
                child: BmiCard(
              child: GenderIconText(
                title: "Female",
                icon: Icons.female,
                color: Colors.pink,
              ),
            ))
          ],
        )),
        Expanded(
            child: Container(
          child: BmiCard(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Text(
                "HEIGHT",
                style: LabelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$height",
                    // ignore: prefer_const_constructors
                    style: ValueTextStyle,
                  ),
                  Text(
                    "cm",
                    style: LabelTextStyle,
                  )
                ],
              ),
              Slider(
                  value: height.toDouble(),
                  min: 30,
                  max: 200,
                  thumbColor: ButtonColor,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    height = value.toInt();
                    setState(() {});
                  })
            ],
          )),
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: BmiCard(
                  child: CardColumn(
                title: "WEIGHT",
                unit: "Kg",
                value: weight,
              )),
            ),
            Expanded(
              child: BmiCard(
                  child: CardColumn(
                title: "AGE",
                unit: "",
                value: age,
              )),
            ),
          ],
        )),
        GestureDetector(
          onTap: () {
            // print(calculateBMI());
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return BmiResultScreen(
                bmiResult: calculateBMI(),
              );
            }));
          },
          child: Container(
            color: ButtonColor,
            height: 60,
            child: const Center(
                child: Text(
              "Hitung BMI",
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

class CardColumn extends StatefulWidget {
  CardColumn({
    Key? key,
    required this.title,
    required this.unit,
    required this.value,
  }) : super(key: key);

  final String title;
  final String unit;
  late int value;

  @override
  State<CardColumn> createState() => _CardColumnState();
}

class _CardColumnState extends State<CardColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.title,
          style: LabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${widget.value}",
              style: ValueTextStyle,
            ),
            Text(
              widget.unit,
              style: LabelTextStyle,
            )
          ],
        ),
        Center(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: RawMaterialButton(
                    onPressed: () {
                      widget.value++;
                      setState(() {});
                    },
                    elevation: 0,
                    // ignore: prefer_const_constructors
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                    shape: CircleBorder(),
                    fillColor: Color(0xff212714),
                    constraints: BoxConstraints.tightFor(width: 56, height: 56),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: RawMaterialButton(
                    onPressed: () {
                      widget.value--;
                      setState(() {});
                    },
                    elevation: 0,
                    // ignore: prefer_const_constructors
                    child: Icon(
                      Icons.remove,
                      size: 20,
                      color: Colors.white,
                    ),
                    shape: CircleBorder(),
                    fillColor: Color(0xff212714),
                    constraints: BoxConstraints.tightFor(width: 56, height: 56),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: SecondaryColor, borderRadius: BorderRadius.circular(15)),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: color,
        ),
        Text(
          title,
          style: LabelTextStyle,
        ),
      ],
    );
  }
}
