import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const Color reusableCardColorActive = Color(0xFF1D1E33);
const Color reusableCardColorInactive = Color(0xFF111328);
const Color bottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = reusableCardColorInactive;
  Color femaleCardColor = reusableCardColorInactive;

  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColor == reusableCardColorInactive) {
        maleCardColor = reusableCardColorActive;
        femaleCardColor = reusableCardColorInactive;
      } else {
        maleCardColor = reusableCardColorInactive;
      }
    }

    if (selectedGender == Gender.female) {
      if (femaleCardColor == reusableCardColorInactive) {
        femaleCardColor = reusableCardColorActive;
        maleCardColor = reusableCardColorInactive;
      } else {
        femaleCardColor = reusableCardColorInactive;
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
          const Expanded(
            child: ReusableCard(
              colorReusableCard: reusableCardColorActive,
              cardChild: Row(),
            ),
          ),
          const Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colorReusableCard: reusableCardColorActive,
                    cardChild: Column(),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colorReusableCard: reusableCardColorActive,
                    cardChild: Column(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
          ),
        ],
      ),
    );
  }
}
