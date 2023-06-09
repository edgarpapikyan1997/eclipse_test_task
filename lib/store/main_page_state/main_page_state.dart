import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eds_test/data/services/api_service.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/user_model.dart';

part 'main_page_state.g.dart';

class MainState = _MainState with _$MainState;

abstract class _MainState with Store {
  @observable
  ObservableList<UserModel> users = <UserModel>[].asObservable();

  @action
  Future<void> getAllUsers() async {
    try {
      final response = await ApiService.getAllUsers();
      users.addAll(response);
    } on DioException catch (error) {
      log(error.toString());
    }
  }
}
