import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:subway_info_app_prac/domain/subway.dart';

class SubwayApi {
  Future<List<Subway>> fetch(String query) async {
    final url =
        Uri.parse('http://swopenapi.seoul.go.kr/api/subway/sample/json/realtime'
            'StationArrival/0/5/$query');
    final response = await http.get(url);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable realtimeArrivalList = jsonResponse['realtimeArrivalList'];
    return realtimeArrivalList.map((e) => Subway.fromJson(e)).toList();
  }
}
