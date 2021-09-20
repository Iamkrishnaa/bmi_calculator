import 'package:bmi/components/custom_card.dart';
import 'package:bmi/const.dart';
import 'package:bmi/controllers/bmi_controller.dart';
import 'package:bmi/models/bmi.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final Bmi bmi;

  const ResultPage({Key? key, required this.bmi}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String bmiData = "NA";
  String result = "NA";
  BMIController? controller;

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = BMIController(bmi: widget.bmi);
      bmiData = controller!.getBMI();
      result = controller!.getResult();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
            child: Text(
              "Your Result",
              style: kNumberStyle,
            ),
          ),
          Expanded(
            child: CustomCard(
              color: kActiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade400,
                    ),
                  ),
                  Text(
                    bmiData,
                    style: kNumberStyle,
                  ),
                  const Text(
                    "Please eat too much as much as you want.",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: kButtonHeight,
            child: Card(
              color: kButtonColor,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                splashColor: Colors.red,
                child: Center(
                  child: Text(
                    "Re-Calculate".toUpperCase(),
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
