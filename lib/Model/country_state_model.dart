import 'dart:ffi';

class CountryState {
  String? updated;
  String? country;
  CountryInfo? countryInfo;
  String? cases;
  String? todayCases;
  String? deaths;
  String? todayDeaths;
  String? recovered;
  String? todayRecovered;
  String? active;
  String? critical;
  String? casesPerOneMillion;
  String? deathsPerOneMillion;
  String? tests;
  String? testsPerOneMillion;
  String? population;
  String? continent;
  String? oneCasePerPeople;
  String? oneDeathPerPeople;
  String? oneTestPerPeople;
  String? activePerOneMillion;
  String? recoveredPerOneMillion;
  String? criticalPerOneMillion;

  CountryState(
      {this.updated,
      this.country,
      this.countryInfo,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.continent,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion});

  CountryState.fromJson(Map<String, dynamic> json) {
    updated = json['updated'].toString();
    country = json['country'];
    countryInfo = json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null;
    cases = json['cases'].toString();
    todayCases = json['todayCases'].toString();
    deaths = json['deaths'].toString();
    todayDeaths = json['todayDeaths'].toString();
    recovered = json['recovered'].toString();
    todayRecovered = json['todayRecovered'].toString();
    active = json['active'].toString();
    critical = json['critical'].toString();
    casesPerOneMillion = json['casesPerOneMillion'].toString();
    deathsPerOneMillion = json['deathsPerOneMillion'].toString();
    tests = json['tests'].toString();
    testsPerOneMillion = json['testsPerOneMillion'].toString();
    population = json['population'].toString();
    continent = json['continent'].toString();
    oneCasePerPeople = json['oneCasePerPeople'].toString();
    oneDeathPerPeople = json['oneDeathPerPeople'].toString();
    oneTestPerPeople = json['oneTestPerPeople'].toString();
    activePerOneMillion = json['activePerOneMillion'].toString();
    recoveredPerOneMillion = json['recoveredPerOneMillion'].toString();
    criticalPerOneMillion = json['criticalPerOneMillion'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated'] = this.updated;
    data['country'] = this.country;
    if (this.countryInfo != null) {
      data['countryInfo'] = this.countryInfo!.toJson();
    }
    data['cases'] = this.cases;
    data['todayCases'] = this.todayCases;
    data['deaths'] = this.deaths;
    data['todayDeaths'] = this.todayDeaths;
    data['recovered'] = this.recovered;
    data['todayRecovered'] = this.todayRecovered;
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['casesPerOneMillion'] = this.casesPerOneMillion;
    data['deathsPerOneMillion'] = this.deathsPerOneMillion;
    data['tests'] = this.tests;
    data['testsPerOneMillion'] = this.testsPerOneMillion;
    data['population'] = this.population;
    data['continent'] = this.continent;
    data['oneCasePerPeople'] = this.oneCasePerPeople;
    data['oneDeathPerPeople'] = this.oneDeathPerPeople;
    data['oneTestPerPeople'] = this.oneTestPerPeople;
    data['activePerOneMillion'] = this.activePerOneMillion;
    data['recoveredPerOneMillion'] = this.recoveredPerOneMillion;
    data['criticalPerOneMillion'] = this.criticalPerOneMillion;
    return data;
  }
}

class CountryInfo {
  int? iId;
  String? iso2;
  String? iso3;
  String? lat;
  String? long;
  String? flag;

  CountryInfo({this.iId, this.iso2, this.iso3, this.lat, this.long, this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    lat = json['lat'].toString();
    long = json['long'].toString();
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['iso2'] = this.iso2;
    data['iso3'] = this.iso3;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['flag'] = this.flag;
    return data;
  }
}
