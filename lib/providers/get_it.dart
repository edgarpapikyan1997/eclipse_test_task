import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../constants/flavor.dart';
import '../data/dio.dart';
import '../data/interceptors/api_interceptor.dart';
import 'flavor_service.dart';

final locator = GetIt.instance;

void registerGetIt(Flavor flavorMode) {
  dio.interceptors.addAll(
    <Interceptor>[
      ApiInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (res) {
          log(res.toString(), name: 'BE');
        },
      ),
    ],
  );

  GetIt.I.registerLazySingleton<FlavorService>(
    () => FlavorService(
      flavor: flavorMode,
    ),
  );
}
