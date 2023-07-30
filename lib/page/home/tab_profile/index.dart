import 'package:flutter/material.dart';
import 'package:rent_house/page/home/tab_profile/tab_profile_header.dart';

import '../tab_index/index_info.dart';
import 'advertisement.dart';
import 'function_button.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('setting');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        title: const Text(
          '我的',
          // style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: const [
          TabProfileHeader(),
          FunctionButton(),
          Advertisement(),
          Info(
            showTitle: true,
          ),
        ],
      ),
    );
  }
}