import 'dart:developer';

import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:fwc_album_app/app/repository/stickers/stickers_repository.dart';

import './my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  final StickersRepository stickersRepository;
  late final MyStickersView _view;

  var album = <GroupsStickers>[];
  var statusSelected = 'all';
  List<String>? countries;

  MyStickersPresenterImpl({required this.stickersRepository});

  @override
  Future<void> getMyAlbum() async {
    try {
      album = await stickersRepository.getMyAlbum();
      _view.loadedPage([...album]);
    } catch (e) {
      log('Erro ao buscar album', error: e);
      _view.error('Erro ao buscar album do usuário');
    }
  }

  @override
  set view(MyStickersView view) => _view = view;

  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;

    if (countries == null) {
      _view.updateAlbum(album);
    } else {
      final albumFilter = album
          .where((element) => countries.contains(element.countryCode))
          .toList();
      _view.updateAlbum(albumFilter);
    }
  }

  @override
  Future<void> refresh() async {
    _view.showLoader();
    await getMyAlbum();
    countryFilter(countries);
    statusFilter(statusSelected);
  }
}
