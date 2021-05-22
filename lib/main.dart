import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_covid/screens/search_screen.dart';
import 'screens/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(Covid());
}

class Covid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/searchCountry': (context) => CountrySearch(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF212529), //0xFF212529
        scaffoldBackgroundColor: Color(0xFF212529),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(0xFFFEFAE0),
          ),
        ),
      ),
      home: MainPage(),
    );
  }
}
