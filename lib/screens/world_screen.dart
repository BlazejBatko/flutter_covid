import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_covid/utilities/ReusableCard.dart';
import 'package:flutter_covid/utilities/const.dart';
import 'package:flutter_covid/services/fetch_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';

import '../utilities/CasesWidget.dart';

class WorldScreen extends StatefulWidget {
  WorldScreen({this.worldData, this.continentData});

  final worldData;
  final continentData;

  @override
  _WorldScreenState createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> {
  int todayDeaths;
  int todayCases;
  int todayRecovered;

  int todayDeathsAM;
  int todayCasesAM;
  int todayRecoveredAM;

  int todayDeathsAMS;
  int todayCasesAMS;
  int todayRecoveredAMS;

  int todayDeathsAS;
  int todayCasesAS;
  int todayRecoveredAS;

  int todayDeathsEU;
  int todayCasesEU;
  int todayRecoveredEU;

  int todayDeathsAF;
  int todayCasesAF;
  int todayRecoveredAF;

  int todayDeathsAU;
  int todayCasesAU;
  int todayRecoveredAU;

  void updateUI(dynamic worldData, dynamic continentData) {
    todayDeaths = worldData['todayDeaths'];
    todayCases = worldData['todayCases'];
    todayRecovered = worldData['todayRecovered'];

    todayDeathsAM = continentData[0]['todayDeaths'];
    todayCasesAM = continentData[0]['todayCases'];
    todayRecoveredAM = continentData[0]['todayRecovered'];

    todayDeathsAS = continentData[1]['todayDeaths'];
    todayCasesAS = continentData[1]['todayCases'];
    todayRecoveredAS = continentData[1]['todayRecovered'];

    todayDeathsAMS = continentData[2]['todayDeaths'];
    todayCasesAMS = continentData[2]['todayCases'];
    todayRecoveredAMS = continentData[2]['todayRecovered'];

    todayDeathsEU = continentData[3]['todayDeaths'];
    todayCasesEU = continentData[3]['todayCases'];
    todayRecoveredEU = continentData[3]['todayRecovered'];

    todayDeathsAF = continentData[4]['todayDeaths'];
    todayCasesAF = continentData[4]['todayCases'];
    todayRecoveredAF = continentData[4]['todayRecovered'];

    todayDeathsAU = continentData[5]['todayDeaths'];
    todayCasesAU = continentData[5]['todayCases'];
    todayRecoveredAU = continentData[5]['todayRecovered'];
  }

  void updateChart(dynamic worldData) {
    todayDeaths = worldData['todayDeaths'];
    todayCases = worldData['todayCases'];
    todayRecovered = worldData['todayRecovered'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.worldData, widget.continentData);
    toMap(todayCases, todayDeaths, todayRecovered);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushNamed(context, '/'),
        ),
        centerTitle: true,
        title: Text('TODAY WORLD DATA'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CasesWidget(
                  casesText: 'TOTAL',
                  casesNumber: todayCases.toString(),
                  casesNumberStyle: kCasesNumberCases,
                ),
                CasesWidget(
                  casesNumber: todayRecovered.toString(),
                  casesText: 'RECOVERED',
                  casesNumberStyle: kCasesNumberRecovered,
                ),
                Expanded(
                  child: ReusableExpCard(
                    colour: kActiveCardColour,
                    cardChild: PieChart(
                      dataMap: dataMap,
                      animationDuration: Duration(milliseconds: 5000),
                      chartLegendSpacing: 10,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: colorList,
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      centerText: 'WORLD DAILY \nCHART',
                      ringStrokeWidth: 20,
                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.bottom,
                        showLegends: false,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: true,
                        decimalPlaces: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                CasesWidget(
                  casesNumber: todayDeaths.toString(),
                  casesText: 'DEATHS',
                  casesNumberStyle: kCasesNumberDeaths,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      ReusableExpCard(
                        colour: kActiveCardColour,
                        cardChild: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('NORTH AMERICA'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    todayCasesAM.toString(),
                                    style: kCasesNumberCasesSmall,
                                  ),
                                  Text(
                                    todayDeathsAM.toString(),
                                    style: kCasesNumberDeathsSmall,
                                  ),
                                  Text(
                                    todayRecoveredAM.toString(),
                                    style: kCasesNumberRecoveredSmall,
                                  ),
                                ],
                              ),
                              Text('SOUTH AMERICA'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    todayCasesAMS.toString(),
                                    style: kCasesNumberCasesSmall,
                                  ),
                                  Text(
                                    todayDeathsAMS.toString(),
                                    style: kCasesNumberDeathsSmall,
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    todayRecoveredAMS.toString(),
                                    style: kCasesNumberRecoveredSmall,
                                  ),
                                ],
                              ),
                              Text('ASIA'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    todayCasesAS.toString(),
                                    style: kCasesNumberCasesSmall,
                                  ),
                                  Text(
                                    todayDeathsAS.toString(),
                                    style: kCasesNumberDeathsSmall,
                                  ),
                                  Text(
                                    todayRecoveredAS.toString(),
                                    style: kCasesNumberRecoveredSmall,
                                  ),
                                ],
                              ),
                              Text('EUROPE'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    todayCasesEU.toString(),
                                    style: kCasesNumberCasesSmall,
                                  ),
                                  Text(
                                    todayDeathsEU.toString(),
                                    style: kCasesNumberDeathsSmall,
                                  ),
                                  Text(
                                    todayRecoveredEU.toString(),
                                    style: kCasesNumberRecoveredSmall,
                                  ),
                                ],
                              ),
                              Text('AFRICA'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    todayCasesAF.toString(),
                                    style: kCasesNumberCasesSmall,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    todayDeathsAF.toString(),
                                    style: kCasesNumberDeathsSmall,
                                  ),
                                  Text(
                                    todayRecoveredAF.toString(),
                                    style: kCasesNumberRecoveredSmall,
                                  ),
                                ],
                              ),
                              Text('AUSTRALIA'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    todayCasesAU.toString(),
                                    style: kCasesNumberCasesSmall,
                                  ),
                                  Text(
                                    todayDeathsAU.toString(),
                                    style: kCasesNumberDeathsSmall,
                                  ),
                                  Text(
                                    todayRecoveredAU.toString(),
                                    style: kCasesNumberRecoveredSmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Map<String, double> dataMap = {};

  Map<String, double> toMap(dynamic cases, dynamic deaths, dynamic recovered) {
    updateChart(widget.worldData);

    dataMap = {
      "Cases": cases.toDouble(),
      "Recovered": recovered.toDouble(),
      "Deaths": deaths.toDouble(),
    };

    return dataMap;
  }

  List<Color> colorList = [
    Color(0xFFFFFFFF),
    Color(0xFF059611),
    Color(0xFF990003),
  ];
}
