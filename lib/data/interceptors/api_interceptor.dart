import 'package:dio/dio.dart';

import '../../providers/flavor_service.dart';
import '../../providers/get_it.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = locator<FlavorService>().config.apiUrl;
    if (options.data is Map) {
      /// remove nulls from request body [options.data]
      (options.data as Map<dynamic, dynamic>).removeWhere((k, v) => v == null);
    }
    return handler.next(options);
  }
}
