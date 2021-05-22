import 'package:flutter/material.dart';
import 'package:flutter_covid/screens/world_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/fetch_api.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }

  void getApiData() async {
    WorldCases worldCases = new WorldCases();
    ContinentCases continentCases = new ContinentCases();

    var worldCasesVar = await worldCases.getWorldCases();

    var continentCasesVar = await continentCases.getContinentCases();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WorldScreen(
                  worldData: worldCasesVar,
                  continentData: continentCasesVar,
                )));
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
