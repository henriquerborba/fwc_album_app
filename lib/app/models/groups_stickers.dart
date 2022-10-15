import 'dart:convert';

import 'user_sticker_model.dart';

class GroupsStickers {
  final int id;
  final String countryCode;
  final String countryName;
  final int stickersStart;
  final int stickersEnd;
  final List<UserStickerModel> stickers;
  final String flag;

  GroupsStickers({
    required this.id,
    required this.countryCode,
    required this.countryName,
    required this.stickersStart,
    required this.stickersEnd,
    required this.stickers,
    required this.flag,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'country_code': countryCode,
      'country_name': countryName,
      'stickers_start': stickersStart,
      'stickers_end': stickersEnd,
      'stickers': stickers.map((x) => x.toMap()).toList(),
      'flag': flag,
    };
  }

  factory GroupsStickers.fromMap(Map<String, dynamic> map) {
    return GroupsStickers(
      id: map['id']?.toInt() ?? 0,
      countryCode: map['country_code'] ?? '',
      countryName: map['country_name'] ?? '',
      stickersStart: map['stickers_start']?.toInt() ?? 0,
      stickersEnd: map['stickers_end']?.toInt() ?? 0,
      stickers: List<UserStickerModel>.from(
          map['stickers']?.map((x) => UserStickerModel.fromMap(x))),
      flag: map['flag'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupsStickers.fromJson(String source) =>
      GroupsStickers.fromMap(json.decode(source));
}
