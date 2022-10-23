import 'package:fwc_album_app/app/models/sticker_model.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository.dart';

import './find_sticker_service.dart';
import '../../models/register_sticker_model.dart';

class FindStickerServiceImpl implements FindStickerService {
  final StickersRepository stickersRepository;

  FindStickerServiceImpl({required this.stickersRepository});

  @override
  Future<StickerModel> execute(String contryName, String stickerNumber) async {
    var sticker = await stickersRepository.findStickerByCode(
      contryName,
      stickerNumber,
    );

    if (sticker == null) {
      final registerSticker = RegisterStickerModel(
        name: '',
        stickerCode: contryName,
        stickerNumber: stickerNumber,
      );

      sticker = await stickersRepository.create(registerSticker);
    }

    return sticker;
  }
}
