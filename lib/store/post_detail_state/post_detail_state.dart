import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/comment_model.dart';
import '../../data/services/api_service.dart';

part 'post_detail_state.g.dart';

class PostDetailState = _PostDetailState with _$PostDetailState;

abstract class _PostDetailState with Store {
  @observable
  ObservableList<CommentModel> comments = <CommentModel>[].asObservable();

  @action
  Future<void> getCommentsByPostId({required int postId}) async {
    try {
      final response = await ApiService.getCommentsByPostId(postId);
      comments = response.asObservable();
    } on DioException catch (error) {
      log(
        error.toString(),
      );
    }
  }
}
