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
      backgroundColor: Color(0xff0a0e21),
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
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
              SizedBox(
                height: 20,
              ),
              Text(
                "HEIGHT",
                style: labelTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$height",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "cm",
                    style: labelTextStyle,
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
        Expanded(child: Container(color: Colors.green)),
        GestureDetector(
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return BmiResultScreen();
            })),
          },
          child: Container(
            color: Colors.lightBlue,
            height: 60,
            child: Center(child: Text("Hitung BMI")),
          ),
        )
      ]),
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
        margin: EdgeInsets.all(15),
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
          style: labelTextStyle,
        ),
      ],
    );
  }
}
