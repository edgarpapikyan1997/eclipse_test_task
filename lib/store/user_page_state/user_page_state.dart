import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/album_model.dart';
import '../../data/models/post_model.dart';
import '../../data/services/api_service.dart';

part 'user_page_state.g.dart';

class UserPageState = _UserPageState with _$UserPageState;

abstract class _UserPageState with Store {
  @observable
  ObservableList<PostModel> posts = <PostModel>[].asObservable();

  @observable
  ObservableList<AlbumModelWithPhotos> albums =
      <AlbumModelWithPhotos>[].asObservable();

  @action
  Future<void> getPostsByUserId({
    required int userId,
  }) async {
    try {
      final response = await ApiService.getPostsByUserId(userId);
      posts = response.asObservable();
    } on DioException catch (error) {
      log(error.toString());
    }
  }

  @action
  Future<void> getAlbumsByUserIdWithPhotos({
    required int userId,
  }) async {
    try {
      final response = await ApiService.getAlbumsByUserIdWithPhotos(userId);
      albums = response.asObservable();
    } on DioException catch (error) {
      log(error.toString());
    }
  }
}
