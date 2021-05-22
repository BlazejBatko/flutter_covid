import 'package:flutter/cupertino.dart';
import 'ReusableCard.dart';
import 'const.dart';

class CasesWidget extends ReusableExpCard {
  CasesWidget({this.casesNumber, this.casesText, this.casesNumberStyle});

  final String casesNumber;
  final String casesText;
  final TextStyle casesNumberStyle;

  @override
  Widget build(BuildContext context) {
    return ReusableExpCard(
      colour: kActiveCardColour,
      cardChild: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              casesText,
              style: kLabelTextStyle,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              casesNumber,
              style: casesNumberStyle,
            ),
          )
        ],
      ),
    );
  }
}
