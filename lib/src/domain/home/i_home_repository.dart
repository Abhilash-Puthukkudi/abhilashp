import 'package:machine_test/src/domain/core/models/response_models/all_matches_model_with_copy_with/all_matches_model_with_copy_with.dart';
import 'package:machine_test/src/domain/core/models/response_models/common_response/common_response.dart';
import 'package:machine_test/src/domain/core/models/response_models/profile_data_model/profile_data_model.dart';

abstract class IHomeRepository {
  Future<AllMatchesModelWithCopyWith> loadAllMatches();
  Future<AllMatchesModelWithCopyWith> loadNewMatches();
  Future<AllMatchesModelWithCopyWith> loadSugessionsMatches();
  Future<CommonResponse> shortListUser({required String profileId, required String create});

  Future<ProfileDataModel> loadProfile({required String profileId});

  Future<CommonResponse> sendIntrest({required String reciverID});
  Future<CommonResponse> acceptRejectIntrest({required String senderId, required String status});
  Future<CommonResponse> undoIntrest({
    required String reciverID,
  });
}
