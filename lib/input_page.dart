import 'package:flutter/material.dart';

const Color reusableCardColor = Color(0xFF1D1E33);
const Color bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colorReusableCard: reusableCardColor),
                ),
                Expanded(
                  child: ReusableCard(colorReusableCard: reusableCardColor),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ReusableCard(colorReusableCard: reusableCardColor),
          ),
          const Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colorReusableCard: reusableCardColor),
                ),
                Expanded(
                  child: ReusableCard(colorReusableCard: reusableCardColor),
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

class ReusableCard extends StatelessWidget {
  final Color colorReusableCard;

  const ReusableCard({super.key, required this.colorReusableCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colorReusableCard,
      ),
    );
  }
}
