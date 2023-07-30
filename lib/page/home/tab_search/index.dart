import 'dart:async';
import 'package:flutter/material.dart';
import '../../../scoped_model/data.dart';
import '../../../scoped_model/scoped_model_helper.dart';
import '../../../widget/common_picker.dart';
import '../../../widget/romm_list_item_widget.dart';
import '../../../widget/search_bar.dart';
import 'data.dart';
import 'filter_drawer.dart';
import 'item.dart';

class IndexSearch extends StatefulWidget {
  const IndexSearch({Key? key}) : super(key: key);

  @override
  _IndexSearchState createState() => _IndexSearchState();
}

class _IndexSearchState extends State<IndexSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const FilterDrawer(),
      appBar: AppBar(
        title: SearchBar(
          showLocation: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 41.0,
            child: FilterBar(
              onChange: (data) {},
            ),
          ),
          Expanded(
            child: ListView(
              children: dataList
                  .map((item) => RoomListItemWidget(
                        data: item,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;

  const FilterBar({Key? key, required this.onChange}) : super(key: key);

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPreceActive = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  _onAreaChange(context) {
    setState(() {
      isAreaActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      options: areaList.map((item) => item.name).toList(),
      value: 0,
    );
    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList[index].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isAreaActive = false;
      });
    });
  }

  _onRentTypeChange(context) {
    setState(() {
      isAreaActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      options: rentTypeList.map((item) => item.name).toList(),
      value: 0,
    );
    result.then((index) {
      if (index == null) return;
      setState(() {
        rentTypeId = rentTypeList[index].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isAreaActive = false;
      });
    });
  }

  _onPriceChange(context) {
    setState(() {
      isAreaActive = true;
    });
    var result = CommonPicker.showPicker(
      context: context,
      options: priceList.map((item) => item.name).toList(),
      value: 0,
    );
    result.then((index) {
      if (index == null) return;
      setState(() {
        priceId = priceList[index].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isAreaActive = false;
      });
    });
  }

  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();
  }

  _onChange() {
    var selectedList =
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    widget.onChange(
      FilterBarResult(
        areaId: areaId,
        priceId: priceId,
        rentTypeId: rentTypeId,
        moreIds: selectedList.toList(),
        priceTypeId: '',
        moreId: [],
      ),
    );
  }

  _getData() {
    Map<String, List<GeneralType>> dataList = <String, List<GeneralType>>{};
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;
    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
  }

  @override
  void initState() {
    Timer.run(_getData);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _onChange();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.0,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Item(
            title: '区域',
            isActive: isAreaActive,
            onTap: _onAreaChange,
          ),
          Item(
            title: '方式',
            isActive: isAreaActive,
            onTap: _onRentTypeChange,
          ),
          Item(
            title: '租金',
            isActive: isAreaActive,
            onTap: _onPriceChange,
          ),
          Item(
            title: '筛选',
            isActive: isAreaActive,
            onTap: _onFilterChange,
          ),
        ],
      ),
    );
  }
}
