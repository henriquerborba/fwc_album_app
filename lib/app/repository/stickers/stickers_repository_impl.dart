import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album_app/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/models/register_sticker_model.dart';
import 'package:fwc_album_app/app/models/sticker_model.dart';

import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;
  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupsStickers>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');

      return result.data
          .map<GroupsStickers>((e) => GroupsStickers.fromMap(e))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar album', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar album do usuário');
    }
  }

  @override
  Future<StickerModel?> findStickerByCode(
      String stickerCode, String stickerNumber) async {
    try {
      final result =
          await dio.auth().get('/api/sticker-search', queryParameters: {
        'sticker_code': stickerCode,
        'sticker_number': stickerNumber,
      });

      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 404) {
        return null;
      }

      log('Erro ao buscar figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar figurinha');
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModel registerStickerModel) async {
    try {
      final body = FormData.fromMap(
          {...registerStickerModel.toMap(), 'sticker_image_upload': ''});

      final result = await dio.auth().post('/api/stickers', data: body);

      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao registrar figurinha', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar figurinha');
    }
  }

  @override
  Future<void> registerUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().post('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount,
      });
    } on DioError catch (e, s) {
      log('Erro ao inserir figurinha no album do usuário',
          error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao inserir figurinha no album do usuário');
    }
  }

  @override
  Future<void> upateUserSticker(int stickerId, int amount) async {
    try {
      await dio.auth().put('/api/user/sticker', data: {
        'id_sticker': stickerId,
        'amount': amount,
      });
    } on DioError catch (e, s) {
      log('Erro ao inserir figurinha no album do usuário',
          error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Erro ao inserir figurinha no album do usuário');
    }
  }
}
