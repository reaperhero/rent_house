// 搜索页数据准备
class RoomListItemData {
  final String id;
  final String title;
  final String subTitle;
  final String imageUrl;
  final List<String> tags;
  final int price;
  const RoomListItemData(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.imageUrl,
      required this.tags,
      required this.price});
}
