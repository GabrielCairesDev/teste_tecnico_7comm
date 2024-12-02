import 'package:dio/dio.dart';
import 'package:flutter_dev_test/constants/endpoint.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(_baseOptions());

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }

  BaseOptions _baseOptions() {
    return BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
      validateStatus: (status) => status! < 500,
    );
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      return await dio.post(path, data: data);
    } on DioException catch (e) {
      // ignore: avoid_print
      print('Error in POST request: $e');
      rethrow;
    }
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  void _onError(DioException e, ErrorInterceptorHandler handler) {
    handler.next(e);
  }

  Dio get client => dio;
}
