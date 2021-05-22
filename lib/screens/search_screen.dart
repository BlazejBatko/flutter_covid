import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_covid/utilities/const.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'country_screen.dart';
import 'loading_screen_country.dart';

class CountrySearch extends StatefulWidget {
  @override
  _CountrySearchState createState() => _CountrySearchState();
}

class _CountrySearchState extends State<CountrySearch> {
  String countryName;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFff5859),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ENTER COUNTRY',
                        style: kNumbersStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          countryName = value;
                        },
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        decoration: kInputFieldDecoration,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Image(
                image: NetworkImage(
                  'https://cdn.dribbble.com/users/108183/screenshots/3563250/map_pin_by_volorf.gif',
                ),
              ),
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    nextPage();
                  });
                },
                child: Text(
                  '➡',
                  style: kLabelTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void nextPage() {
    if (countryName != null)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoadingScreenCountry(
                    country: countryName,
                  )));
    // ignore: unnecessary_statements
    else {
      Fluttertoast.showToast(
          msg: 'INPUT FIELD CAN\'T STAY EMPTY',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: kActiveCardColour,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
