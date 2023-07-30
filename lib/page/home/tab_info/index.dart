import 'package:flutter/material.dart';

import '../../../widget/search_bar.dart';
import '../tab_index/index_info.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({Key? key}) : super(key: key);

  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          showLocation: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: const [
          Padding(padding: EdgeInsets.only(top: 8)),
          Info(),
        ],
      ),
    );
  }
}
