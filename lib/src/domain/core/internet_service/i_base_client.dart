import 'package:http/http.dart';

abstract class IBaseClient {
  Future<Response> get({required String url, Map<String, String>? header});

  Future<Response> getWithProfile({
    required String url,
    Map<String, String>? headers,
  });

  Future<Response> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  });

  Future<Response> postWithProfile(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, String>? headers});
}
