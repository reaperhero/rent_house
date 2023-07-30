import 'package:flutter/material.dart';
import 'package:rent_house/model/info_item.dart';

class Info extends StatelessWidget {
  final bool showTitle;
  final List<InfoItem> dataList;

  const Info({Key? key, this.showTitle = false, this.dataList = infoData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showTitle)
          Container(
            padding: const EdgeInsets.only(left: 7),
            alignment: Alignment.centerLeft,
            child: const Text(
              '最新资讯',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
            ),
          ),
        Column(
          // 所以在这里传入一个 map 值的 item 列表
          children: dataList.map((item) => ItemWidget(data: item)).toList(),
        )
      ],
    );
  }
}

var textStyle = const TextStyle(fontSize: 14, color: Colors.black54);

class ItemWidget extends StatelessWidget {
  final InfoItem data;

  // data 作为必传参数，是一个 InfoItem 列表
  const ItemWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Image.network(
            data.imageUrl,
            height: 150,
            width: 120,
          ),
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.source, style: textStyle),
                  Text(data.time, style: textStyle),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

const List<InfoItem> infoData = [
  InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l4obbj305v04fjsw.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: 'login'),
  InfoItem(
      title: '置业选择 | 珠江新城 三室一厅 广州的隔江眺望',
      imageUrl:
          'https://tva1.sinaimg.cn/large/008i3skNgy1gsu64d1yyyj30ik0awabs.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: 'login'),
  InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'https://tva1.sinaimg.cn/large/008i3skNgy1gsu65bbztrj30ks0cugmw.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: 'login'),
  InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'https://tva1.sinaimg.cn/large/008i3skNgy1gsu66qegzmj30ki0c0abf.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: 'login'),
  InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'https://tva1.sinaimg.cn/large/008i3skNgy1gsu67i9v77j30io0cejt4.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: 'login'),
  InfoItem(
      title: '置业选择 | 安贞西里 三室一厅 河间的古雅别院',
      imageUrl:
          'https://tva1.sinaimg.cn/large/008i3skNgy1gsu68f9pyuj30m20ccgnp.jpg',
      source: "新华网",
      time: "两天前",
      navigateUrl: 'login'),
];
