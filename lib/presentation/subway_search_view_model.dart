import 'dart:async';

import 'package:flutter/material.dart';
import 'package:subway_info_app_prac/data/subway_api.dart';
import 'package:subway_info_app_prac/presentation/components/subway.dart';

class SubwaySearchViewModel with ChangeNotifier {
  Timer? _debounce;
  final SubwayApi api;

  bool isLoading = false;
  List<Subway> subwayList = [];

  SubwaySearchViewModel(this.api);

  Future<void> fetchData(String query) async {
    isLoading = true;
    notifyListeners();

    subwayList = await api.fetch(query);
    isLoading = false;
    notifyListeners();
  }

  onTextChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchData(query);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
  }
}
