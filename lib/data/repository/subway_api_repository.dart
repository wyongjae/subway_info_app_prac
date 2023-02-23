import 'package:subway_info_app_prac/data/data_source/subway_api.dart';
import 'package:subway_info_app_prac/presentation/components/subway.dart';

class SubwayApiRepository {
  final SubwayApi api;

  SubwayApiRepository(this.api);

  Future<List<Subway>> fetch(String query) async {
    return api.fetch(query);
  }
}
