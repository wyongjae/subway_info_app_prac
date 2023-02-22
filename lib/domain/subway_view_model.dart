import 'dart:async';

import 'package:flutter/material.dart';
import 'package:subway_info_app_prac/data/subway_api.dart';
import 'package:subway_info_app_prac/domain/subway.dart';

class SubwayViewModel with ChangeNotifier {
  final SubwayApi api;

  SubwayViewModel(this.api);

  final _subwayStreamController = StreamController<List<Subway>>();

  Stream<List<Subway>> get subwayStream => _subwayStreamController.stream;

  Future<void> fetchData(String query) async {
    final result = await api.fetch(query);
    _subwayStreamController.add(result);
    notifyListeners();
  }
}
