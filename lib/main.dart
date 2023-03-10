import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subway_info_app_prac/data/data_source/subway_api.dart';
import 'package:subway_info_app_prac/data/repository/subway_api_repository.dart';
import 'package:subway_info_app_prac/presentation/subway_search_view_model.dart';
import 'package:subway_info_app_prac/presentation/subway_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              SubwaySearchViewModel(SubwayApiRepository(SubwayApi())),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SubwaySearchScreen(),
      ),
    );
  }
}
