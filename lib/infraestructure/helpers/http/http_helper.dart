import 'http_base.dart';

export 'http_base.dart';
class HttpHelper {
  static Future<ReturnHttp> get({
    required String url,
    String? baseUrl,
    bool authorization = false,
    Headers? headers,
    Map<String, String>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    final response = await httpBase(
        type: TypeHTPP.GET,
        body: body,
        path: url,
        headers: headers,
        baseUrl: baseUrl,
        queryParameters: queryParameters,
        authorization: authorization);

    return response;
  }

  static Future<ReturnHttp> post({
    required String url,
    String? baseUrl,
    bool authorization = false,
    Headers? headers,
    Map<String, dynamic>? body,
  }) async {
    final response = await httpBase(
        type: TypeHTPP.POST,
        path: url,
        headers: headers,
        baseUrl: baseUrl,
        authorization: authorization,
        body: body);
    return response;
  }

  static Future<ReturnHttp> put({
    required String url,
    String? baseUrl,
    bool authorization = false,
    Headers? headers,
    Map<String, dynamic>? body,
  }) async {
    final response = await httpBase(
        type: TypeHTPP.PUT,
        path: url,
        headers: headers,
        baseUrl: baseUrl,
        authorization: authorization,
        body: body);
    return response;
  }

  static Future<ReturnHttp> delete({
    required String url,
    String? baseUrl,
    bool authorization = false,
    Headers? headers,
    Map<String, dynamic>? body,
  }) async {
    final response = await httpBase(
        type: TypeHTPP.DELETE,
        path: url,
        headers: headers,
        baseUrl: baseUrl,
        authorization: authorization,
        body: body);
    return response;
  }
}
