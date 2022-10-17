import '../../../models/groups_stickers.dart';

abstract class MyStickersView {
  void loadedPage(List<GroupsStickers> groupsStickers);
  void error(String message);
  void updateStatusFilter(String status);
  void updateAlbum(List<GroupsStickers> album);
}
