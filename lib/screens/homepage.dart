import 'package:bmi/components/custom_card.dart';
import 'package:bmi/components/custom_rounded_button.dart';
import 'package:bmi/components/icon_component.dart';
import 'package:bmi/const.dart';
import 'package:bmi/models/bmi.dart';
import 'package:bmi/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? selectedGender;
  int height = 150;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: CustomCard(
                        color: selectedGender == Gender.male
                            ? kActiveColor
                            : kInactiveColor,
                        child: const IconComponent(
                          icon: FontAwesomeIcons.mars,
                          text: "Male",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: CustomCard(
                        color: selectedGender == Gender.female
                            ? kActiveColor
                            : kInactiveColor,
                        child: const IconComponent(
                          icon: FontAwesomeIcons.venus,
                          text: "Female",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                color: kInactiveColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Height",
                        style: kTitleStyle,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          "cm",
                          style: kTitleStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xffeb1555),
                        overlayColor: const Color(0x29eb1555),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        min: 100,
                        max: 300,
                        value: height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                        inactiveColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      color: kInactiveColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Weight",
                              style: kTitleStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              weight.toString(),
                              style: kNumberStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRoundButton(
                                icon: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(width: 10),
                              CustomRoundButton(
                                icon: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      color: kInactiveColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Age",
                              style: kTitleStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              age.toString(),
                              style: kNumberStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRoundButton(
                                icon: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              const SizedBox(width: 10),
                              CustomRoundButton(
                                icon: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: kButtonHeight,
              child: Card(
                color: kButtonColor,
                child: InkWell(
                  onTap: () {
                    Bmi bmi = Bmi(height: height, weight: weight, age: age);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ResultPage(
                        bmi: bmi,
                      );
                    }));
                  },
                  splashColor: Colors.red,
                  child: Center(
                    child: Text(
                      "Calculate".toUpperCase(),
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
