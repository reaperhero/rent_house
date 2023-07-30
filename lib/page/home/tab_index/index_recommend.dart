import 'package:flutter/material.dart';

class IndexRecomment extends StatelessWidget {
  final List<IndexRecommendItem>? dataList;

  const IndexRecomment({Key? key, this.dataList = indexRecommendData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Color(0x08000000),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('房屋推荐', style: TextStyle(fontWeight: FontWeight.w600)),
              Text('更多', style: TextStyle(fontWeight: FontWeight.w300)),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Wrap(
              runSpacing: 10.0,
              spacing: 10.0,
              children: dataList!
                  .map((item) => IndexRecommendItemWidget(item))
                  .toList()),
        ],
      ),
    );
  }
}

var textStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem data;

  const IndexRecommendItemWidget(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(data.navigateUrl);
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: (MediaQuery.of(context).size.width) / 2.3,
        // width: 170.0,
        height: 90.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.title, style: textStyle),
                Text(data.subTitle, style: textStyle),
              ],
            ),
            Image.asset(data.imageUrl, width: 60.0),
          ],
        ),
      ),
    );
  }
}

class IndexRecommendItem {
  final String title;
  final String subTitle;
  final String imageUrl;
  final String navigateUrl;
  const IndexRecommendItem(
      this.title, this.subTitle, this.imageUrl, this.navigateUrl);
}

const List<IndexRecommendItem> indexRecommendData = [
  IndexRecommendItem(
      '家住回龙观', '归属的感觉', 'static/images/home_index_recommend_1.png', 'login'),
  IndexRecommendItem(
      '宜居四五环', '大都市生活', 'static/images/home_index_recommend_2.png', 'login'),
  IndexRecommendItem(
      '喧嚣三里屯', '繁华的背后', 'static/images/home_index_recommend_3.png', 'login'),
  IndexRecommendItem(
      '比邻十号线', '地铁心连心', 'static/images/home_index_recommend_4.png', 'login'),
];
