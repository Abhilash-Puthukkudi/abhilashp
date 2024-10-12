import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:machine_test/src/domain/core/pref_key/preference_key.dart';
import 'package:machine_test/src/infrastructure/core/preference_helper.dart';

import '../../domain/core/failures/api_auth_failure.dart';
import '../../domain/core/failures/api_failure.dart';
import '../../domain/core/internet_service/i_base_client.dart';

@LazySingleton(as: IBaseClient)
class InternetHelper extends IBaseClient {
  InternetHelper(this.client);
  final http.Client client;

  @override
  Future<http.Response> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      final response =
          await client.post(Uri.parse(url), body: body, headers: {});
      log("------------------------------------------------");
      log("URL       : $url");
      log("RESPONSE  : ${response.body}");
      log("STATUS CODE : ${response.statusCode}");
      log("------------------------------------------------");
      if (response.statusCode.toInt() == 404 ||
          response.statusCode.toInt() == 429) {
        final res = jsonDecode(response.body.toString());
        throw ApiFailure(res['message']);
      }
      if (response.statusCode.toInt() == 409) {
        final res = jsonDecode(response.body.toString());
        throw ApiFailure(res['message']);
      }
      if (response.statusCode.toInt() == 401) {
        final res = jsonDecode(response.body.toString());
        throw ApiFailure(res['message']);
      }
      if (response.statusCode.toInt() == 403) {
        final res = jsonDecode(response.body.toString());
        throw ApiFailure(res['message'][0]);
      }

      if (response.body.isEmpty) {
        throw ApiFailure('no data found');
      }
      return _response(response);
    } on SocketException {
      log("socket ");
      throw ApiFailure('Internet service not found!');
    } on ApiFailure catch (e) {
      throw ApiFailure(e.error);
    } on TimeoutException {
      throw ApiFailure('Time out');
    } on ApiAuthFailure catch (_) {
      throw ApiAuthFailure('Api authentication failed');
    } catch (e, s) {
      log("${e}stacktrace$s");
      throw ApiFailure('something went worng !');
    }
  }

  http.Response _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 500:
        throw ApiFailure('error 500');
      case 400:
        throw ApiFailure('error 400');
      case 404:
        throw ApiAuthFailure('Authentication expired');
      default:
        throw ApiFailure('error invalid');
    }
  }

  @override
  Future<http.Response> get(
      {required String url, Map<String, String>? header}) async {
    try {
      final response = await client.get(Uri.parse(url), headers: header);
      if (response.body.isEmpty) {
        throw ApiFailure('no data found');
      }
      return _response(response);
    } on SocketException {
      throw ApiFailure('Internet service not found!');
    } on ApiFailure catch (e) {
      throw ApiFailure(e.error);
    } on TimeoutException {
      throw ApiFailure('Time out');
    } on ApiAuthFailure catch (_) {
      throw ApiAuthFailure('Api authentication failed');
    } catch (e) {
      throw ApiFailure('something went worng !');
    }
  }

  @override
  Future<http.Response> getWithProfile(
      {required String url, Map<String, String>? headers}) async {
    try {
      final accessToken =
          await PreferenceHelper().getString(key: AppPrefeKeys.accessToken);
      final defaultheader = {
        'Authorization': 'Bearer $accessToken',
      };
      final Map<String, String> combainedHeaders = {
        ...defaultheader,
        if (headers != null) ...headers
      };
      log("URL       : $url");
      final response =
          await client.get(Uri.parse(url), headers: combainedHeaders);
      log("------------------------------------------------");
      log("URL       : $url");
      log("RESPONSE  : ${response.body}");
      log("STATUS CODE : ${response.statusCode}");
      log("------------------------------------------------");

      if (response.body.isEmpty) {
        throw ApiFailure('no data found');
      }
      return _response(response);
    } on SocketException {
      throw ApiFailure('Internet service not found!');
    } on ApiFailure catch (e) {
      throw ApiFailure(e.error);
    } on TimeoutException {
      throw ApiFailure('Time out');
    } on ApiAuthFailure catch (_) {
      throw ApiAuthFailure('Api authentication failed');
    } catch (e) {
      log(e.toString());
      throw ApiFailure('something went worng !');
    }
  }

  @override
  Future<http.Response> postWithProfile(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    try {
      final accessToken =
          await PreferenceHelper().getString(key: AppPrefeKeys.accessToken);
      final defaultheader = {
        'Authorization': 'Bearer $accessToken',
      };
      final Map<String, String> combainedHeaders = {
        ...defaultheader,
        if (headers != null) ...headers
      };
      final response = await client.post(Uri.parse(url),
          body: body, headers: combainedHeaders);
      log("------------------------------------------------");
      log("URL       : $url");
      log("RESPONSE  : ${response.body}");
      log("STATUS CODE : ${response.statusCode}");
      log("------------------------------------------------");
      if (response.statusCode.toInt() == 404 ||
          response.statusCode.toInt() == 429) {
        final res = jsonDecode(response.body.toString());
        throw ApiFailure(res['message']);
      }
      if (response.statusCode.toInt() == 409) {
        final res = jsonDecode(response.body.toString());
        throw ApiFailure(res['message']);
      }
      if (response.statusCode.toInt() == 401) {
        final res = jsonDecode(response.body.toString());
        throw ApiFailure(res['message']);
      }
      if (response.statusCode.toInt() == 403) {
        final res = jsonDecode(response.body.toString());
        throw ApiFailure(res['message'][0]);
      }

      if (response.body.isEmpty) {
        throw ApiFailure('no data found');
      }
      return _response(response);
    } on SocketException {
      log("socket ");
      throw ApiFailure('Internet service not found!');
    } on ApiFailure catch (e) {
      throw ApiFailure(e.error);
    } on TimeoutException {
      throw ApiFailure('Time out');
    } on ApiAuthFailure catch (_) {
      throw ApiAuthFailure('Api authentication failed');
    } catch (e, s) {
      log("${e}stacktrace$s");
      throw ApiFailure('something went worng !');
    }
  }
}
