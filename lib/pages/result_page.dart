import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/reUsebleCard.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.only(left: 20, top: 25),
                child: Text('Your Result', style: yourResultTextStyle),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReUsableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText, style: resutTextTextStyle),
                  Text(bmiResult, style: bmiResultTextStyle),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      interpretation,
                      style: interpretationTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: bottomContainerColor,
              height: bottomContainerHeight,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10.0),
              child: const Center(
                  child: Text('RE-CALCULATE', style: calculateButtonTextStyle)),
            ),
          )
        ],
      ),
    );
  }
}
