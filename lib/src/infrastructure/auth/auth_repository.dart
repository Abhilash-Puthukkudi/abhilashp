import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:machine_test/src/domain/auth/i_auth_respository.dart';
import 'package:machine_test/src/domain/core/app_url/app_urls.dart';
import 'package:machine_test/src/domain/core/failures/api_failure.dart';
import 'package:machine_test/src/domain/core/internet_service/i_base_client.dart';
import 'package:machine_test/src/domain/core/models/pm_models/pm_login_model/pm_login_model.dart';
import 'package:machine_test/src/domain/core/models/response_models/login_model/login_model.dart';

@LazySingleton(as: IAuthRespository)
class AuthRepository extends IAuthRespository {
  final IBaseClient client;

  AuthRepository(this.client);
  @override
  Future<LoginModel> login({required PmLoginModel loginModel}) async {
    try {
      final response = await client
          .post(url: AppUrls.loginUrl, body: loginModel.toJson())
          .timeout(
            const Duration(seconds: 30),
          );
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      return LoginModel.fromJson(decode);
    } on TimeoutException {
      throw ApiFailure("Request timeout please try Again!");
    } catch (e) {
      rethrow;
    }
  }
}
