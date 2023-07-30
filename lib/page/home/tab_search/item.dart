//结果数据类型
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterBarResult {
  final String areaId;
  final String priceId;
  final String rentTypeId;
  final List<String> moreIds;

  FilterBarResult(
      {required this.areaId,
      required this.priceId,
      required this.rentTypeId,
      required this.moreIds,
      required String priceTypeId,
      required List<String> moreId});
}

class Item extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function(BuildContext) onTap;

  const Item(
      {Key? key,
      required this.title,
      required this.isActive,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = isActive ? Colors.green : Colors.black87;
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap(context);
      },
      child: Container(
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(color: color, fontSize: 18),
            ),
            Icon(
              Icons.arrow_drop_down,
              size: 20,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
