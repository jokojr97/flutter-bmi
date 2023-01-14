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
  int height = 100;
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
                  thumbColor: Colors.red,
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
          children: const [
            Expanded(
              child: BmiCard(
                  child: CardColumn(
                title: "Weight",
                unit: "Kg",
                value: "80",
              )),
            ),
            Expanded(
              child: BmiCard(
                  child: CardColumn(
                title: "Age",
                unit: "",
                value: "20",
              )),
            ),
          ],
        )),
        GestureDetector(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const BmiResultScreen();
            })),
          },
          child: Container(
            color: Colors.lightBlue,
            height: 60,
            child: const Center(child: Text("Hitung BMI")),
          ),
        )
      ]),
    );
  }
}

class CardColumn extends StatelessWidget {
  const CardColumn({
    Key? key,
    required this.title,
    required this.unit,
    required this.value,
  }) : super(key: key);

  final String title;
  final String unit;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: LabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              value,
              style: ValueTextStyle,
            ),
            Text(
              unit,
              style: LabelTextStyle,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              // ignore: prefer_const_constructors
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              // ignore: prefer_const_constructors
              child: Icon(
                Icons.remove,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
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
