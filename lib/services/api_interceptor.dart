import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    //options.headers["Authorization"] = "Bearer $token";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.badResponse &&
        err.response?.statusCode == 401) {
      print('Token expired - kullanıcı logout olmalı veya token yenilenmeli');
      // Örn: authService.logout(); veya refresh token çağrısı yapılabilir.
      // Buraya logout / token yenileme işlemi gelebilir yukardakinden
    } else if (err.type == DioExceptionType.connectionError) {
      print('İnternet bağlantısı yok');
    }
    super.onError(err, handler);
  }
}
