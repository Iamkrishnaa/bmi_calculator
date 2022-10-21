import 'package:bmi/components/custom_card.dart';
import 'package:bmi/components/custom_rounded_button.dart';
import 'package:bmi/components/icon_component.dart';
import 'package:bmi/const.dart';
import 'package:bmi/models/bmi.dart';
import 'package:bmi/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// enum for switching either male or female
enum Gender {
  male,
  female,
}

/// Home page widget
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? selectedGender;

  /// initial height value
  int height = 150;

  /// initial weight value
  int weight = 60;

  /// initial age value
  int age = 20;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    heightController.text = height.toString();
    weightController.text = weight.toString();
    ageController.text = age.toString();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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

                        SizedBox(
                          width:75,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: heightController,
                            style: kNumberStyle,
                            decoration: fieldDecorator,
                            onChanged: (value){
                              setState((){
                                int temp = int.parse(value);
                                if(temp>=100&&temp<=300)
                                {
                                  height = temp;
                                }
                              });
                            },
                          ),
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
                            heightController.text = value.toInt().toString();
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
                            child: SizedBox(
                              width: 75,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlign: TextAlign.center,
                                controller: weightController,
                                style: kNumberStyle,
                                decoration: fieldDecorator,
                                onChanged: (value){
                                  setState((){
                                    weight = int.parse(value);
                                  });
                                },
                              ),
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
                                    weightController.text = weight.toString();
                                  });
                                },
                              ),
                              const SizedBox(width: 10),
                              CustomRoundButton(
                                icon: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(() {
                                    weight++;
                                    weightController.text = weight.toString();
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
                            child: SizedBox(
                              width: 75,
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textAlign: TextAlign.center,
                                controller: ageController,
                                style: kNumberStyle,
                                decoration: fieldDecorator,
                                onChanged: (value){
                                  setState((){
                                    age = int.parse(value);
                                  });
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomRoundButton(
                                icon: FontAwesomeIcons.minus,
                                onTap: () {
                                  setState(
                                    () {
                                      age--;
                                      ageController.text = age.toString();
                                    },
                                  );
                                },
                              ),
                              const SizedBox(width: 10),
                              CustomRoundButton(
                                icon: FontAwesomeIcons.plus,
                                onTap: () {
                                  setState(
                                    () {
                                      age++;
                                      ageController.text = age.toString();
                                    },
                                  );
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
                    BMI bmi = BMI(height: height, weight: weight, age: age);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ResultPage(
                            bmi: bmi,
                          );
                        },
                      ),
                    );
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
