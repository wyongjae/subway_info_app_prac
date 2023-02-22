import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subway_info_app_prac/domain/subway.dart';

import '../domain/subway_view_model.dart';

class SubwaySearchPage extends StatefulWidget {
  const SubwaySearchPage({Key? key}) : super(key: key);

  @override
  State<SubwaySearchPage> createState() => _SubwaySearchPageState();
}

class _SubwaySearchPageState extends State<SubwaySearchPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SubwayViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Subway'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    '역 이름',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                await viewModel.fetchData(_controller.text);
                              },
                              icon: const Icon(Icons.search))),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              StreamBuilder<List<Subway>>(
                initialData: const [],
                stream: viewModel.subwayStream,
                builder: (BuildContext context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final datas = snapshot.data ?? [];

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: datas.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = datas[index];

                      return Column(
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(data.trainLineNm),
                                const SizedBox(width: 5),
                                const Text(','),
                                const SizedBox(width: 5),
                                Text(data.arvlMsg2),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
