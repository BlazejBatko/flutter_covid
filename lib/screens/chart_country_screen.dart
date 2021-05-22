import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid/utilities/ReusableCard.dart';
import 'package:flutter_covid/utilities/const.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:json_annotation/json_annotation.dart';

class ChartScreen extends StatefulWidget {
  ChartScreen({this.historyData});

  final historyData;

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final fromDate = DateTime.now().subtract(Duration(days: 6));
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 5));
  final date2 = DateTime.now().subtract(Duration(days: 4));
  final date3 = DateTime.now().subtract(Duration(days: 3));
  final date4 = DateTime.now().subtract(Duration(days: 2));
  final date5 = DateTime.now().subtract(Duration(days: 1));

  List<int> casesList = [];
  List<int> deathsList = [];
  List<int> recoveredList = [];

  List<int> casesSubstract = [];
  List<int> deathsSubstract = [];
  List<int> recoveredSubstract = [];

  void toMaps() {
    Map cases = widget.historyData['timeline']['cases'];

    cases.forEach((key, value) {
      casesList.add(value);
    });

    Map deaths = widget.historyData['timeline']['deaths'];

    deaths.forEach((key, value) {
      deathsList.add(value);
    });
    Map recovered = widget.historyData['timeline']['recovered'];

    recovered.forEach((key, value) {
      recoveredList.add(value);
    });
  }

  void updateSubstractLists() {
    for (int i = 0; i <= casesList.length - 2; i++) {
      casesSubstract.add(casesList[i + 1] - casesList[i]);

      deathsSubstract.add(deathsList[i + 1] - deathsList[i]);

      recoveredSubstract.add(recoveredList[i + 1] - recoveredList[i]);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.historyData);

    toMaps();
    updateSubstractLists();

    print(casesSubstract);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COUNTRY CHARTS'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ReusableExpCard(
            colour: kActiveCardColour,
            cardChild: BezierChart(
              bezierChartScale: BezierChartScale.WEEKLY,
              fromDate: fromDate,
              toDate: toDate,
              selectedDate: toDate,
              series: [
                BezierLine(
                  lineColor: Color(0xFFFFFFFF),
                  label: 'CASES',
                  data: [
                    DataPoint<DateTime>(value: casesSubstract[0].toDouble(), xAxis: fromDate),
                    DataPoint<DateTime>(value: casesSubstract[1].toDouble(), xAxis: date1),
                    DataPoint<DateTime>(value: casesSubstract[2].toDouble(), xAxis: date2),
                    DataPoint<DateTime>(value: casesSubstract[3].toDouble(), xAxis: date3),
                    DataPoint<DateTime>(value: casesSubstract[4].toDouble(), xAxis: date4),
                    DataPoint<DateTime>(value: casesSubstract[5].toDouble(), xAxis: date5),
                    DataPoint<DateTime>(value: casesSubstract[6].toDouble(), xAxis: toDate),
                  ],
                ),
                BezierLine(
                  lineColor: Color(0xFF990003),
                  label: "DEATHS",
                  data: [
                    DataPoint<DateTime>(value: deathsSubstract[0].toDouble(), xAxis: fromDate),
                    DataPoint<DateTime>(value: deathsSubstract[1].toDouble(), xAxis: date1),
                    DataPoint<DateTime>(value: deathsSubstract[2].toDouble(), xAxis: date2),
                    DataPoint<DateTime>(value: deathsSubstract[3].toDouble(), xAxis: date3),
                    DataPoint<DateTime>(value: deathsSubstract[4].toDouble(), xAxis: date4),
                    DataPoint<DateTime>(value: deathsSubstract[5].toDouble(), xAxis: date5),
                    DataPoint<DateTime>(value: deathsSubstract[6].toDouble(), xAxis: toDate),
                  ],
                ),
                BezierLine(
                  lineColor: Color(0xFF059611),
                  label: 'RECOVERED',
                  data: [
                    DataPoint<DateTime>(value: recoveredSubstract[0].toDouble(), xAxis: fromDate),
                    DataPoint<DateTime>(value: recoveredSubstract[1].toDouble(), xAxis: date1),
                    DataPoint<DateTime>(value: recoveredSubstract[2].toDouble(), xAxis: date2),
                    DataPoint<DateTime>(value: recoveredSubstract[3].toDouble(), xAxis: date3),
                    DataPoint<DateTime>(value: recoveredSubstract[4].toDouble(), xAxis: date4),
                    DataPoint<DateTime>(value: recoveredSubstract[5].toDouble(), xAxis: date5),
                    DataPoint<DateTime>(value: recoveredSubstract[6].toDouble(), xAxis: toDate),
                  ],
                ),
              ],
              config: BezierChartConfig(
                verticalIndicatorStrokeWidth: 20,
                verticalIndicatorColor: Colors.black26,
                showVerticalIndicator: true,
                backgroundColor: kActiveCardColour,
                snap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
