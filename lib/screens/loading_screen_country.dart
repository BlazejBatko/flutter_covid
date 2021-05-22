import 'package:flutter/material.dart';
import 'package:flutter_covid/screens/world_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'country_screen.dart';
import 'error_page.dart';
import '../services/fetch_api.dart';

class LoadingScreenCountry extends StatefulWidget {
  LoadingScreenCountry({this.country});

  final String country;
  @override
  _LoadingScreenCountryState createState() => _LoadingScreenCountryState();
}

class _LoadingScreenCountryState extends State<LoadingScreenCountry> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiDataCountry();
  }

  void getApiDataCountry() async {
    CountryHistoryCases countryHistoryCases = new CountryHistoryCases();

    var countryHistoryCasesVar = await countryHistoryCases.getHistoryCases(widget.country);

    CountryCases countryCases = new CountryCases();

    var countryCasesVar = await countryCases.getCountryCases(widget.country);

    try {
      if (countryCasesVar != null)
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CountryScreen(
                      countryData: countryCasesVar,
                      historyCountryData: countryHistoryCasesVar,
                    )));
      else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ErrorScreen(
                      entry: widget.country,
                    )));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitChasingDots(color: Colors.white, size: 100),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('LOADING...'),
            ),
          ],
        ),
      ),
    );
  }
}
