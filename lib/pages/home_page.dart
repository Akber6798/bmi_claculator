import 'package:bmi_calculator/components/reUsableCardChild.dart';
import 'package:bmi_calculator/components/reUsebleCard.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/constants.dart';
import 'package:bmi_calculator/components/result_functionality.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? selectedGender;
  int currentValue = 100;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  //Male Card
                  child: ReUsableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inActiveCardColor,
                    cardChild: ReUsableCardChild(
                        icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  //Female Card
                  child: ReUsableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : inActiveCardColor,
                    cardChild: ReUsableCardChild(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  //Height Card
                  child: ReUsableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'HEIGHT',
                          style: labelTextStyle,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(currentValue.toString(),
                                style: heightTextStyle),
                            const Text(
                              'cm',
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        //Slider Widget
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey[600],
                            thumbColor: bottomContainerColor,
                            overlayColor:
                                const Color.fromARGB(255, 235, 171, 190),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30.0),
                          ),
                          child: Slider(
                              min: 80,
                              max: 210,
                              value: currentValue.toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  currentValue = value.toInt();
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  //Weight card
                  child: ReUsableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: heightTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Weight Button
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1D1F33),
                                  fixedSize: const Size(55, 55),
                                  shape: const CircleBorder(),
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: const Text(
                                  '-',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 45),
                                )),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1D1F33),
                                fixedSize: const Size(55, 55),
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Text(
                                '+',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 40),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:
                      //Age Card
                      ReUsableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: heightTextStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //Age Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1D1F33),
                                fixedSize: const Size(55, 55),
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Text('-',
                                  style: elevatedButtonTextStyle),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1D1F33),
                                fixedSize: const Size(55, 55),
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Text(
                                '+',
                                style: elevatedButtonTextStyle,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //CalCulate Button
          GestureDetector(
            onTap: () {
              CalculatorBrain cal = CalculatorBrain( heightBrain: currentValue, weightBrain: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return ResultPage(
                     bmiResult: cal.calculateBMI(),
                      resultText: cal.getResults(),
                      interpretation: cal.getInterPretation(),
                    );
                  }),
                ),
              );
            },
            child: Container(
              color: bottomContainerColor,
              height: bottomContainerHeight,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10.0),
              child: const Center(
                  child: Text('CALCULATE', style: calculateButtonTextStyle)),
            ),
          ),
        ],
      ),
    );
  }
}
