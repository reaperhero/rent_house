import 'package:scoped_model/scoped_model.dart';

//通用类型
class GeneralType {
  final String name;
  final String id;

  GeneralType(this.name, this.id);
}

List<GeneralType> areaList = [
  GeneralType('区域1', '11'),
  GeneralType('区域2', '22'),
];
List<GeneralType> priceList = [
  GeneralType('价格1', 'bb'),
  GeneralType('价格2', 'aa'),
];
List<GeneralType> rentTypeList = [
  GeneralType('出租类型1', 'bb'),
  GeneralType('出租类型2', '22'),
];
List<GeneralType> roomTypeList = [
  GeneralType('房屋类型1', '11'),
  GeneralType('房屋类型2', '22'),
];
List<GeneralType> orientedList = [
  GeneralType('方向1', '99'),
  GeneralType('方向2', 'cc'),
];
List<GeneralType> floorList = [
  GeneralType('楼层1', 'aa'),
  GeneralType('楼层2', 'bb'),
];

class FilterBarModel extends Model {
  final List<GeneralType> _roomTypeList = [];
  final List<GeneralType> _orientedList = [];
  List<GeneralType> floorList = [];

  final Set<String> _selectedList = <String>{};

  Map<String, List<GeneralType>> get dataList {
    var result = <String, List<GeneralType>>{};
    result['roomTypeList'] = _roomTypeList;
    result['orientedList'] = _orientedList;
    result['roomTypeList'] = floorList;
    return result;
  }

  set dataList(Map<String, List<GeneralType>> data) {
    notifyListeners();
  }

  Set<String> get selectedList {
    return _selectedList;
  }

  selectedListTroggleItem(String data) {
    if (_selectedList.contains(data)) {
      _selectedList.remove(data);
    } else {
      _selectedList.add(data);
    }
  }

  @override
  notifyListeners();
}
