import 'package:flutter/material.dart';
import 'package:flutter_covid/utilities/const.dart';

class ErrorScreen extends StatefulWidget {
  ErrorScreen({this.entry});
  final String entry;
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  String text = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    text = widget.entry;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, '/searchCountry'),
        ),
      ),
      body: Container(
        color: kBottomContainerColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                ':(',
                style: TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(10.0, 10.0),
                      blurRadius: 5.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Shadow(offset: Offset(10.0, 10.0), blurRadius: 8.0, color: Colors.white10),
                  ],
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 150,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Can\'t find data for your entry',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'make sure ${widget.entry} is valid country name',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
