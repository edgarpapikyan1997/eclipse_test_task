// ignore_for_file: inference_failure_on_function_invocation

import 'package:eds_test/data/models/album_model.dart';
import 'package:eds_test/data/models/comment_model.dart';
import 'package:eds_test/data/models/photo_model.dart';
import 'package:eds_test/data/models/post_model.dart';
import 'package:eds_test/data/models/user_model.dart';

import '../dio.dart';

class ApiService {
  static Future<List<UserModel>> getAllUsers() async {
    const url = '/users/';
    final response = await dio.get(url);
    final jsonResponse = List<Map<String, dynamic>>.from(response.data as List);
    return jsonResponse.map(UserModel.fromMap).toList();
  }

  static Future<List<PostModel>> getAllPosts() async {
    const url = '/posts/';
    final response = await dio.get(url);
    final jsonResponse = List<Map<String, dynamic>>.from(response.data as List);
    return jsonResponse.map(PostModel.fromMap).toList();
  }

  static Future<List<AlbumModel>> getAllAlbums() async {
    const url = '/albums';
    final response = await dio.get(url);
    final jsonResponse = List<Map<String, dynamic>>.from(response.data as List);
    return jsonResponse.map(AlbumModel.fromMap).toList();
  }

  static Future<List<PhotoModel>> getAllPhotos() async {
    const url = '/photos/';
    final response = await dio.get(url);
    final jsonResponse = List<Map<String, dynamic>>.from(response.data as List);
    return jsonResponse.map(PhotoModel.fromMap).toList();
  }

  static Future<List<CommentModel>> getAllComments() async {
    const url = '/comments/';
    final response = await dio.get(url);
    final jsonResponse = List<Map<String, dynamic>>.from(response.data as List);
    return jsonResponse.map(CommentModel.fromMap).toList();
  }

  static Future<List<PostModel>> getPostsByUserId(int userId) async {
    final url = '/user/$userId/posts';
    final response = await dio.get(url);
    final jsonResponse = List<Map<String, dynamic>>.from(response.data as List);
    return jsonResponse.map(PostModel.fromMap).toList();
  }

  static Future<List<AlbumModel>> getAlbumsByUserId(int userId) async {
    final url = '/user/$userId/albums';
    final response = await dio.get(url);
    final jsonResponse = List<Map<String, dynamic>>.from(response.data as List);
    return jsonResponse.map(AlbumModel.fromMap).toList();
  }

  static Future<List<AlbumModelWithPhotos>> getAlbumsByUserIdWithPhotos(
    int userId,
  ) async {
    final url = '/user/$userId/albums?_embed=photos';
    final response = await dio.get(url);
    final jsonResponse = List<Map<String, dynamic>>.from(response.data as List);
    return jsonResponse.map(AlbumModelWithPhotos.fromMap).toList();
  }

  static Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async {
    final url = '/albums/$albumId/photos/';
    final response = await dio.get(url);
    final jsonResponse = List<Map<String, dynamic>>.from(response.data as List);
    return jsonResponse.map(PhotoModel.fromMap).toList();
  }

  static Future<List<CommentModel>> getCommentsByPostId(int postId) async {
    final url = '/posts/$postId/comments/';
    final response = await dio.get(url);
    final jsonResponse = List<Map<String, dynamic>>.from(response.data as List);
    return jsonResponse.map(CommentModel.fromMap).toList();
  }

  static Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    const url = '/comments/';
    await dio.post(
      url,
      data: {
        'name': name,
        'email': email,
        'body': body,
      },
    );
  }
}
