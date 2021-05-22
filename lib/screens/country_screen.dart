import 'package:flutter/material.dart';
import 'package:flutter_covid/utilities/CasesWidget.dart';
import 'package:flutter_covid/utilities/ReusableCard.dart';
import 'package:flutter_covid/utilities/const.dart';
import 'package:pie_chart/pie_chart.dart';

import 'chart_country_screen.dart';

class CountryScreen extends StatefulWidget {
  CountryScreen({this.countryData, this.historyCountryData});

  final countryData;
  final historyCountryData;

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  int countryCases;
  int countryDeaths;
  int countryRecovered;
  String countryFlag;
  String countryName;

  Map<String, double> dataMap = {};

  Map<String, double> toMap() {
    updateUI(widget.countryData);

    Map<String, double> dataMap = {
      "Cases": countryCases.toDouble(),
      "Recovered": countryRecovered.toDouble(),
      "Deaths": countryDeaths.toDouble(),
    };

    return dataMap;
  }

  List<Color> colorList = [
    Color(0xFFFFFFFF),
    Color(0xFF059611),
    Color(0xFF990003),
  ];

  void updateUI(dynamic countryData) {
    countryCases = countryData['todayCases'];
    countryDeaths = countryData['todayDeaths'];
    countryRecovered = countryData['todayRecovered'];
    countryFlag = countryData['countryInfo']['flag'];
    countryName = countryData['country'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.countryData);
    print(widget.historyCountryData);
    toMap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, '/searchCountry'),
        ),
        centerTitle: true,
        title: Text(
          'DAILY COUNTRY CASES',
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                CasesWidget(
                  casesText: 'CASES',
                  casesNumber: countryCases.toString(),
                  casesNumberStyle: kCasesNumberCases,
                ),
                CasesWidget(
                  casesText: 'DEATHS',
                  casesNumber: countryDeaths.toString(),
                  casesNumberStyle: kCasesNumberDeaths,
                ),
                CasesWidget(
                  casesText: 'RECOVERED',
                  casesNumber: countryRecovered.toString(),
                  casesNumberStyle: kCasesNumberRecovered,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReusableExpCard(
                  colour: kActiveCardColour,
                  flexInt: 2,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          countryName.toUpperCase(),
                          style: kLabelTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: NetworkImage(countryFlag, scale: 2),
                        ),
                      ),
                    ],
                  ),
                ),
                ReusableExpCard(
                  flexInt: 3,
                  colour: kActiveCardColour,
                  cardChild: PieChart(
                    dataMap: toMap(),
                    animationDuration: Duration(milliseconds: 5000),
                    chartLegendSpacing: 32,
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    colorList: colorList,
                    initialAngleInDegree: 0,
                    chartType: ChartType.disc,
                    ringStrokeWidth: 32,
                    legendOptions: LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.bottom,
                      showLegends: true,
                      legendTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: false,
                      decimalPlaces: 0,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChartScreen(
                            historyData: widget.historyCountryData,
                          ),
                        ),
                      );
                    },
                    child: ReusableExpCard(
                      colour: kActiveCardColour,
                      flexInt: 1,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'SHOW CHARTS',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
