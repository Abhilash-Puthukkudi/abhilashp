import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:machine_test/src/domain/core/app_url/app_urls.dart';
import 'package:machine_test/src/domain/core/failures/api_failure.dart';
import 'package:machine_test/src/domain/core/internet_service/i_base_client.dart';
import 'package:machine_test/src/domain/core/models/response_models/all_matches_model_with_copy_with/all_matches_model_with_copy_with.dart';
import 'package:machine_test/src/domain/core/models/response_models/common_response/common_response.dart';
import 'package:machine_test/src/domain/core/models/response_models/profile_data_model/profile_data_model.dart';
import 'package:machine_test/src/domain/home/i_home_repository.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  final IBaseClient client;

  HomeRepository(this.client);
  @override
  Future<AllMatchesModelWithCopyWith> loadAllMatches() async {
    try {
      final response = await client
          .getWithProfile(
            url: AppUrls.allMatchesUrl,
          )
          .timeout(
            const Duration(seconds: 30),
          );
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      return AllMatchesModelWithCopyWith.fromJson(decode);
    } on TimeoutException {
      throw ApiFailure("Request timeout please try Again!");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CommonResponse> shortListUser({required String profileId, required String create}) async {
    try {
      log("reaching here");
      final response = await client
          .getWithProfile(
            url: "${AppUrls.shortListUrl}profile_id=$profileId&create=$create",
          )
          .timeout(
            const Duration(seconds: 30),
          );
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      return CommonResponse.fromJson(decode);
    } on TimeoutException {
      throw ApiFailure("Request timeout please try Again!");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AllMatchesModelWithCopyWith> loadNewMatches() async {
    try {
      final response = await client
          .getWithProfile(
            url: AppUrls.newListListUrl,
          )
          .timeout(
            const Duration(seconds: 30),
          );
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      return AllMatchesModelWithCopyWith.fromJson(decode);
    } on TimeoutException {
      throw ApiFailure("Request timeout please try Again!");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AllMatchesModelWithCopyWith> loadSugessionsMatches() async {
    try {
      final response = await client
          .getWithProfile(
            url: AppUrls.suggesionsListUrl,
          )
          .timeout(
            const Duration(seconds: 30),
          );
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      return AllMatchesModelWithCopyWith.fromJson(decode);
    } on TimeoutException {
      throw ApiFailure("Request timeout please try Again!");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProfileDataModel> loadProfile({required String profileId}) async {
    try {
      final response = await client
          .getWithProfile(
            url: AppUrls.profileUrl + profileId,
          )
          .timeout(
            const Duration(seconds: 30),
          );
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      return ProfileDataModel.fromJson(decode);
    } on TimeoutException {
      throw ApiFailure("Request timeout please try Again!");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CommonResponse> sendIntrest({required String reciverID}) async {
    try {
      final response = await client
          .getWithProfile(
            url: AppUrls.createIntrestUrl + reciverID,
          )
          .timeout(
            const Duration(seconds: 30),
          );
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      return CommonResponse.fromJson(decode);
    } on TimeoutException {
      throw ApiFailure("Request timeout please try Again!");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CommonResponse> acceptRejectIntrest({required String senderId, required String status}) async {
    try {
      final response = await client
          .getWithProfile(
            url: "${AppUrls.acceptRejectUrl}state=$status&sent_user_id=$senderId",
          )
          .timeout(
            const Duration(seconds: 30),
          );
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      return CommonResponse.fromJson(decode);
    } on TimeoutException {
      throw ApiFailure("Request timeout please try Again!");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CommonResponse> undoIntrest({required String reciverID}) async {
    try {
      final response = await client.postWithProfile(url: "${AppUrls.undoIntrestUrl}$reciverID/", body: {}).timeout(
        const Duration(seconds: 30),
      );
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      return CommonResponse.fromJson(decode);
    } on TimeoutException {
      throw ApiFailure("Request timeout please try Again!");
    } catch (e) {
      rethrow;
    }
  }
}
