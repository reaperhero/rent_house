
import 'package:flutter/material.dart';

import '../../widget/common_floating_action_button.dart';
import '../../widget/romm_list_item_widget.dart';
import '../home/tab_search/data.dart';

class RoomManagerPage extends StatelessWidget {
  const RoomManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatingActionButton(
          onTap: () {
            Navigator.of(context).pushNamed('roomAdd');
          },
          title: '发布房源',
        ),
        appBar: AppBar(
          title: const Text('房屋管理'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: '空置',
              ),
              Tab(
                text: '已租',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
                children: dataList.map((item) => RoomListItemWidget(
                  data: item,
                ))
                    .toList()),
            ListView(
                children: dataList
                    .map((item) => RoomListItemWidget(
                  data: item,
                ))
                    .toList()),
          ],
        ),
      ),
    );
  }
}