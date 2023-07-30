import 'package:flutter/material.dart';
import '../model/room_list_item.dart';
import 'common_tag.dart';

class RoomListItemWidget extends StatelessWidget {
  final RoomListItemData data;

  const RoomListItemWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('roomDetail/${data.id}');
      },
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 0, bottom: 8),
        child: Row(
          children: [
            Image.network(data.imageUrl, width: 132.5, height: 100),
            const Padding(padding: EdgeInsets.only(left: 8)),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                Text(
                  data.subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Wrap(
                  children: data.tags.map((item) => CommonTag(item)).toList(),
                ),
                Text(
                  '${data.price} 元/月 ',
                  style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
