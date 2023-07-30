import 'dart:io';

import 'package:flutter/material.dart';

import '../../widget/common_floating_action_button.dart';
import '../../widget/common_from_item.dart';
import '../../widget/common_image_picker_item.dart';
import '../../widget/common_radio_from_item.dart';
import '../../widget/common_select_from_item.dart';
import '../../widget/common_title.dart';
import '../room_detail/room_aplication.dart';


class RoomAddPage extends StatefulWidget {
  const RoomAddPage({Key? key}) : super(key: key);

  @override
  _RoomAddPageState createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int rentType = 0;
  int decorationType = 0;
  int roomType = 0;
  int floor = 0;
  int oriented = 0;
  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('房源发布'),
      ),
      body: ListView(
        children: [
          const CommonTitle(title: '房源信息'),
          CommonFormItem(
            //自定义小区
              label: '小区',
              contentBuilder: (context) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent, //解决点击空白地方无效问题
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text('请选择小区', style: TextStyle(fontSize: 16.0)),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('search');
                  },
                );
              }),
          CommonFormItem(
            label: '租金',
            hitText: '请输入租金',
            suffixText: '元/月',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: '大小',
            hitText: '请输入房屋大小',
            suffixText: '平方米',
            controller: TextEditingController(),
          ),
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            onChange: (val) {
              setState(() {
                roomType = val;
              });
            },
            options: const ['一室', '二室', '三室', '四室'],
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            onChange: (val) {
              setState(() {
                floor = val;
              });
            },
            options: const ['高楼层', '中楼层', '低楼层'],
          ),
          CommonSelectFormItem(
            label: '朝向',
            value: oriented,
            onChange: (val) {
              setState(() {
                oriented = val;
              });
            },
            options: const ['东', '南', '西', '北'],
          ),
          CommonRadioFormItem(
            label: '租赁方式',
            options: const ['合租', '整租'],
            value: rentType,
            onChange: (index) {
              setState(() {
                rentType = index;
              });
            },
          ),
          CommonRadioFormItem(
              label: '装修',
              options: const ['精装', '简装'],
              value: decorationType,
              onChange: (index) {
                setState(() {
                  decorationType = index;
                });
              }),
          const CommonTitle(title: '房屋图像'),
          CommonImagePicker(
            onChange: (List<File> files) {},
          ),
          const CommonTitle(title: '房屋标题'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: titleController,
              // maxLength: 2,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '请输入标题，例如（整租，精装，小区名，2室）',
              ),
            ),
          ),
          const CommonTitle(title: '房屋配置'),
          RoomAppliance(
            onChange: (List<RoomApplianceItem> value) {},
          ),
          const CommonTitle(title: '房屋描述'),
          Container(
            margin: const EdgeInsets.only(bottom: 150),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: descController,
              maxLines: 10,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '请输入房屋描述',
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingActionButton(
        title: '提交',
        onTap: () {},
      ),
    );
  }
}
