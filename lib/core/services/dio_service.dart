import 'package:dio/dio.dart';

import '../constant/app_urls.dart';
import 'logger_service.dart';

class DioService {
  final Dio _dio = Dio();
  final logger = LoggerService();

  Future<Response> request(
    String method,
    String endPoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    FormData? formData,
  }) async {
    final getHeaders =
        headers ??
        {"Content-Type": "application/json", "Accept": "application/json"};
    logger.i('Request $method: $endPoint');
    logger.t(getHeaders);
    final request = await _dio.request(
      '${AppUrls.baseUrl}$endPoint',
      data: formData ?? data,
      options: Options(
        method: method,
        headers: getHeaders,
        followRedirects: false,
        validateStatus: (status) => status! < 501,
      ),
    );
    logger.d(request.data);
    return request;
  }

  Future<Response> get(String url, {Map<String, dynamic>? headers}) async =>
      await request('GET', url, headers: headers);

  Future<Response> post(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    FormData? formData,
  }) async => await request(
    'POST',
    url,
    data: data,
    formData: formData,
    headers: headers,
  );

  Future<Response> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async => await request('DELETE', url, data: data, headers: headers);

  Future<Response> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async => await request('PUT', url, data: data, headers: headers);

  Future<Response> patch(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async => await request('PATCH', url, data: data, headers: headers);
}
