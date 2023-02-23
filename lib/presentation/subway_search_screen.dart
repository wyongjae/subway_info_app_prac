import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'subway_search_view_model.dart';

class SubwaySearchScreen extends StatefulWidget {
  const SubwaySearchScreen({Key? key}) : super(key: key);

  @override
  State<SubwaySearchScreen> createState() => _SubwaySearchScreenState();
}

class _SubwaySearchScreenState extends State<SubwaySearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SubwaySearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Subway'),
      ),
      body: Padding(
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
                    onChanged: viewModel.onTextChanged,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            IndexedStack(
              index: viewModel.isLoading ? 0 : 1,
              children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.subwayList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = viewModel.subwayList[index];

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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
