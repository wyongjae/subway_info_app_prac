import 'dart:async';

import 'package:flutter/material.dart';
import 'package:subway_info_app_prac/data/repository/subway_api_repository.dart';
import 'package:subway_info_app_prac/presentation/components/subway.dart';

class SubwaySearchViewModel with ChangeNotifier {
  Timer? _debounce;
  final SubwayApiRepository repository;

  SubwaySearchViewModel(this.repository);

  bool isLoading = false;
  List<Subway> subwayList = [];

  Future<void> fetchData(String query) async {
    isLoading = true;
    notifyListeners();

    subwayList = await repository.fetch(query);
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
