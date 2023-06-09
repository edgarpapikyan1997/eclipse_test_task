// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_page_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserPageState on _UserPageState, Store {
  late final _$postsAtom = Atom(name: '_UserPageState.posts', context: context);

  @override
  ObservableList<PostModel> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<PostModel> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$albumsAtom =
      Atom(name: '_UserPageState.albums', context: context);

  @override
  ObservableList<AlbumModelWithPhotos> get albums {
    _$albumsAtom.reportRead();
    return super.albums;
  }

  @override
  set albums(ObservableList<AlbumModelWithPhotos> value) {
    _$albumsAtom.reportWrite(value, super.albums, () {
      super.albums = value;
    });
  }

  late final _$getPostsByUserIdAsyncAction =
      AsyncAction('_UserPageState.getPostsByUserId', context: context);

  @override
  Future<void> getPostsByUserId({required int userId}) {
    return _$getPostsByUserIdAsyncAction
        .run(() => super.getPostsByUserId(userId: userId));
  }

  late final _$getAlbumsByUserIdWithPhotosAsyncAction = AsyncAction(
      '_UserPageState.getAlbumsByUserIdWithPhotos',
      context: context);

  @override
  Future<void> getAlbumsByUserIdWithPhotos({required int userId}) {
    return _$getAlbumsByUserIdWithPhotosAsyncAction
        .run(() => super.getAlbumsByUserIdWithPhotos(userId: userId));
  }

  @override
  String toString() {
    return '''
posts: ${posts},
albums: ${albums}
    ''';
  }
}
