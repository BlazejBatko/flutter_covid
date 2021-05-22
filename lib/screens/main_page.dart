import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid/utilities/ReusableCard.dart';
import 'package:flutter_covid/utilities/const.dart';
import 'package:flutter_covid/screens/search_screen.dart';
import 'package:flutter_covid/screens/world_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'loading_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                  'COVID TRACKER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 50.0,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              ReusableExpCard(
                colour: kInactiveCardColour,
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
                },
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'WORLD',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        FontAwesomeIcons.globeAmericas,
                        size: 80,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              ReusableExpCard(
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CountrySearch()));
                },
                colour: kInactiveCardColour,
                cardChild: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'COUNTRY',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        FontAwesomeIcons.flag,
                        size: 80,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0,
              ),
            ],
          ),
          GestureDetector(
            onTap: launchURL,
            child: Container(
              color: kBottomContainerColor,
              height: kBottomContainerHeight,
              child: Center(
                child: Text(
                  'WHO SITE',
                  style: kBiggerTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void launchURL() async {
    const url = 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
