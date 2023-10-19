import 'dart:convert';

import 'package:dummy/Model/world_state_model.dart';
import 'package:dummy/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServies {
  Future<WorldStatesModel> fetchWorkedStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStateApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> fetchCountriesStatesRecords() async {
    final res = await http.get(Uri.parse(AppUrl.countriesList));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
