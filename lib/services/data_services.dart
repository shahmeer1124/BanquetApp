import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';

class DataServices {
  String baseurl = "http://18.182.42.34:8000";
  Future<List<DataModel>> getinfo() async {
    var apiUrl = "/gethotels/hotels";
    http.Response res = await http.get(Uri.parse(baseurl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);

        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      
      return <DataModel>[];
    }
  }
}
