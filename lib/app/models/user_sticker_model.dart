import 'dart:convert';

class UserStickerModel {
  final int id;
  final int idUser;
  final int idSticker;
  final int duplicate;
  final String stickerCode;
  final String stickerNumer;

  UserStickerModel({
    required this.id,
    required this.idUser,
    required this.idSticker,
    required this.duplicate,
    required this.stickerCode,
    required this.stickerNumer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_user': idUser,
      'id_sticker': idSticker,
      'duplicate_stickers': duplicate,
      'sticker_code': stickerCode,
      'sticker_number': stickerNumer,
    };
  }

  factory UserStickerModel.fromMap(Map<String, dynamic> map) {
    return UserStickerModel(
      id: map['id']?.toInt() ?? 0,
      idUser: map['id_user']?.toInt() ?? 0,
      idSticker: map['id_sticker']?.toInt() ?? 0,
      duplicate: map['duplicate_stickers']?.toInt() ?? 0,
      stickerCode: map['sticker_code'] ?? '',
      stickerNumer: map['sticker_number'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserStickerModel.fromJson(String source) =>
      UserStickerModel.fromMap(json.decode(source));
}
