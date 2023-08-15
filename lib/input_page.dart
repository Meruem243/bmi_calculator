import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kReusableCardColorInactive;
  Color femaleCardColor = kReusableCardColorInactive;
  int height = 180;

  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == kReusableCardColorInactive) {
        maleCardColor = kReusableCardColorActive;
        femaleCardColor = kReusableCardColorInactive;
      } else {
        maleCardColor = kReusableCardColorInactive;
      }
    }

    if (selectedGender == Gender.female) {
      if (femaleCardColor == kReusableCardColorInactive) {
        femaleCardColor = kReusableCardColorActive;
        maleCardColor = kReusableCardColorInactive;
      } else {
        femaleCardColor = kReusableCardColorInactive;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                        debugPrint('Male pressed');
                      });
                    },
                    child: ReusableCard(
                      colorReusableCard: maleCardColor,
                      cardChild: const IconContent(
                        iconToShow: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                        debugPrint('FeMale pressed');
                      });
                    },
                    child: ReusableCard(
                      colorReusableCard: femaleCardColor,
                      cardChild: const IconContent(
                        iconToShow: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colorReusableCard: kReusableCardColorActive,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: kMinimumHeight.toDouble(),
                    max: kMaximumHeight.toDouble(),
                    activeColor: const Color(0xFFEB1555),
                    inactiveColor: const Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });

                      debugPrint(newValue.toString());
                    },
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colorReusableCard: kReusableCardColorActive,
                    cardChild: Column(),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colorReusableCard: kReusableCardColorActive,
                    cardChild: Column(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
          ),
        ],
      ),
    );
  }
}
