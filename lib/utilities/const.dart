import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0xFF1a1e21); //0xFF4E3318
const kInactiveCardColour = Color(0xFF1a1e21);
const kCardShadowColor = Color(0xFF999999);
const kBottomContainerColor = Color(0xFFff6160);

const kCasesNumberDeaths = TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900, color: Color(0xFF990003));

const kCasesNumberCases = TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900, color: Color(0xFFFFFFFF));

const kCasesNumberRecovered = TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900, color: Color(0xFF059611));

const kCasesNumberDeathsSmall = TextStyle(color: Color(0xFF990003));

const kCasesNumberCasesSmall = TextStyle(color: Color(0xFFFFFFFF));

const kCasesNumberRecoveredSmall = TextStyle(color: Color(0xFF059611));

const kLabelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFFFFFFFF), letterSpacing: 2);

const kNumbersStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kBiggerTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
);

const kInputFieldDecoration = InputDecoration(
  hintText: 'Poland',
  hintStyle: TextStyle(color: Colors.grey),
  filled: true,
  fillColor: Color(0xFFFFFFFF),
  contentPadding: EdgeInsets.all(20),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide: BorderSide.none),
);
