import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task/constants/strings.dart';
import 'package:task/models/users_info.dart';

// ignore: camel_case_types
class Api_Manager {
  Future<List<GetUsers>> fetchJSONData() async {
    var jsonResponse = await http.get(Strings.data_url);

    if (jsonResponse.statusCode == 200) {
      final jsonItems =
          json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

      List<GetUsers> usersList = jsonItems.map<GetUsers>((json) {
        return GetUsers.fromJson(json);
      }).toList();

      return usersList;
    } else {
      throw Exception('Failed to load data from internet');
    }
  }
}
