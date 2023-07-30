import 'package:flutter/material.dart';
import 'package:rent_house/page/home/tab_index/index_navigator_item.dart';
import 'package:rent_house/widget/common_swiper.dart';

import '../../../widget/search_bar.dart';
import 'index_recommend.dart';

class TabIndex extends StatefulWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  State<TabIndex> createState() => _TabIndexState();
}

class _TabIndexState extends State<TabIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchBar(
          shwoLocation: true,
        ),

      ),
      body: ListView(
        children: const [
          CommonSwiper(),
          IndexNavigator(),
          IndexRecomment()
        ],
      ),
    );
  }
}
