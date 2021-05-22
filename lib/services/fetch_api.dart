import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchHelper {
  FetchHelper({this.url});

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}

class WorldCases {
  Future<dynamic> getWorldCases() async {
    FetchHelper fetchHelper = new FetchHelper(url: 'https://corona.lmao.ninja/v2/all');

    var worldData = await fetchHelper.getData();

    return worldData;
  }
}

class ContinentCases {
  Future<dynamic> getContinentCases() async {
    FetchHelper fetchHelper = new FetchHelper(url: 'https://api.caw.sh/v3/covid-19/continents');

    var continentData = await fetchHelper.getData();

    return continentData;
  }
}

class CountryCases {
  Future<dynamic> getCountryCases(String countryName) async {
    FetchHelper fetchHelper = new FetchHelper(url: 'https://corona.lmao.ninja/v2/countries/$countryName');

    var countryData = await fetchHelper.getData();

    return countryData;
  }
}

class CountryHistoryCases {
  Future<dynamic> getHistoryCases(String countryName) async {
    FetchHelper fetchHelper = new FetchHelper(url: 'https://api.caw.sh/v3/covid-19/historical/$countryName?lastdays=8');

    var historyCountryData = await fetchHelper.getData();

    return historyCountryData;
  }
}
