// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostDetailState on _PostDetailState, Store {
  late final _$commentsAtom =
      Atom(name: '_PostDetailState.comments', context: context);

  @override
  ObservableList<CommentModel> get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(ObservableList<CommentModel> value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  late final _$getCommentsByPostIdAsyncAction =
      AsyncAction('_PostDetailState.getCommentsByPostId', context: context);

  @override
  Future<void> getCommentsByPostId({required int postId}) {
    return _$getCommentsByPostIdAsyncAction
        .run(() => super.getCommentsByPostId(postId: postId));
  }

  @override
  String toString() {
    return '''
comments: ${comments}
    ''';
  }
}
