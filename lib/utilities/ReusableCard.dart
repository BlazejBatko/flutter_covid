import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid/utilities/const.dart';

class ReusableExpCard extends StatelessWidget {
  ReusableExpCard({this.colour, this.cardChild, this.onPress, this.flexInt = 1});
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final int flexInt;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexInt,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10), boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(0, 2), spreadRadius: 2, blurRadius: 1),
          ]),
        ),
      ),
    );
  }
}
