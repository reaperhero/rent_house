import 'package:flutter/cupertino.dart';

import '../../widget/common_check_button.dart';
import '../home/tab_profile/function_button.dart';

class Config {
  static const CommonIcon = 'CommonIcon';
  static const BaseUrl =
      'https://www.fastmock.site/mock/432a14676095fee4c04836707d74972f/api';
}


class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);

// const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('衣柜', 0xe918, false),
  RoomApplianceItem('洗衣机', 0xe917, false),
  RoomApplianceItem('空调', 0xe90d, false),
  RoomApplianceItem('天然气', 0xe90f, false),
  RoomApplianceItem('冰箱', 0xe907, false),
  RoomApplianceItem('暖气', 0xe910, false),
  RoomApplianceItem('电视', 0xe908, false),
  RoomApplianceItem('热水器', 0xe912, false),
  RoomApplianceItem('宽带', 0xe90e, false),
  RoomApplianceItem('沙发', 0xe913, false),
];

class RoomAppliance extends StatefulWidget {
//组件参数
  final ValueChanged<List<RoomApplianceItem>> onChange;

  const RoomAppliance({Key? key, required this.onChange}) : super(key: key);

  @override
  _RoomApplianceState createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> list = _dataList;
  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 30.0,
        children: list
            .map((item) => GestureDetector(
          onTap: () {
            //自身组件自改变
            setState(() {
              list = list
                  .map((innerItem) => innerItem == item
                  ? RoomApplianceItem(item.title,
                  item.iconPoint, !item.isChecked)
                  : innerItem)
                  .toList();
            });
            //  同时通知父级
            widget.onChange(list);
          },
          behavior: HitTestBehavior.translucent,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: Column(children: <Widget>[
              Icon(
                //字体图标的使用
                  IconData(item.iconPoint,
                      fontFamily: Config.CommonIcon),
                  size: 40.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(item.title),
              ),
              CommonCheckButton(item.isChecked)
            ]),
          ),
        ))
            .toList());
  }
}

class RoomApplianceList extends StatefulWidget {
  final List<String> list;

  const RoomApplianceList({Key? key, required this.list}) : super(key: key);

  @override
  _RoomApplianceListState createState() => _RoomApplianceListState();
}

class _RoomApplianceListState extends State<RoomApplianceList> {
  @override
  Widget build(BuildContext context) {
    var showList =
    _dataList.where((item) => list.contains(item.title)).toList();
    if (showList.isEmpty) {
      return Container(
        padding: const EdgeInsets.only(left: 10),
        child: const Text('暂无房源配置信息'),
      );
    }
    return Wrap(
        runSpacing: 30.0,
        children: showList
            .map((item) => SizedBox(
          width: MediaQuery.of(context).size.width / 5,
          child: Column(children: <Widget>[
            Icon(
              //字体图标的使用
                IconData(item.iconPoint,
                    fontFamily: Config.CommonIcon),
                size: 40.0),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(item.title),
            ),
            // CommonCheckButton(item.isChecked)
          ]),
        ))
            .toList());
  }
}
