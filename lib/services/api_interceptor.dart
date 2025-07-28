import 'package:dio/dio.dart';
import 'package:stackedproject/app/app.locator.dart';
import 'package:stackedproject/services/auth_service.dart';

class ApiInterceptor extends Interceptor {
  final _authService = locator<AuthService>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _authService.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Content-Type'] = 'application/json';

    print('[REQUEST] ${options.method} ${options.uri}');
    print('Headers: ${options.headers}');
    print('Data: ${options.data}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('[RESPONSE] ${response.statusCode} ${response.requestOptions.uri}');
    print('Response data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.badResponse && err.response?.statusCode == 401) {
      print('Token expired - kullanıcı logout olmalı veya token yenilenmeli');
    } else if (err.type == DioExceptionType.connectionError) {
      print('İnternet bağlantısı yok');
    }
    super.onError(err, handler);
  }
}
