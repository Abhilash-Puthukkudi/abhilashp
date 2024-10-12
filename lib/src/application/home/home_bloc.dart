import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:machine_test/src/application/core/status.dart';
import 'package:machine_test/src/domain/core/failures/api_failure.dart';
import 'package:machine_test/src/domain/core/models/response_models/all_matches_model_with_copy_with/datum.dart';
import 'package:machine_test/src/domain/core/models/response_models/all_matches_model_with_copy_with/interest_status.dart';
import 'package:machine_test/src/domain/core/models/response_models/common_response/common_response.dart';
import 'package:machine_test/src/domain/core/models/response_models/profile_data_model/customer_data.dart';
import 'package:machine_test/src/domain/home/i_home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository _iHomeRepository;
  HomeBloc(this._iHomeRepository) : super(const HomeState()) {
    on<LoadAllMatchesEvent>(_loadMatches);
    on<ShortListEvent>(_shortlistUser);
    on<LoadNewMatchesEvent>(_loadNewMatches);
    on<LoadAllSugetionsEvent>(_loadSugessionsMatches);
    on<LoadProfileEvent>(_loadProfile);
    on<CreateIntrestEvent>(_createIntrest);
    on<AcceptRejectIntrestEvent>(_acceptRejectIntrest);
    on<UndoIntrestEvent>(_undoIntrest);
  }

  FutureOr<void> _undoIntrest(UndoIntrestEvent event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(
          intrestStatus: const StatusInitial(),
        ),
      );

      emit(
        state.copyWith(
          intrestStatus: StatusLoading(),
        ),
      );

      final res = await _iHomeRepository.undoIntrest(reciverID: event.recieverID);

      if (res.respCode == 1) {
        List<UserData> allMatchList = state.allMatchList;
        List<UserData> allSugetionsList = state.sugesstionsList;
        List<UserData> allNewList = state.newMatchList;

        final int userIndexFromMatchList = state.allMatchList.indexWhere((user) => user.id.toString() == event.recieverID.toString());
        final int userIndexFromSugessionsList = state.sugesstionsList.indexWhere((user) => user.id.toString() == event.recieverID.toString());
        final int userIndexFromNewList = state.newMatchList.indexWhere((user) => user.id.toString() == event.recieverID.toString());

        CustomerData profileData = state.profileData;
        if (profileData.id != null) {
          profileData = profileData.copyWith(interestStatus: const InterestStatus());
        }
        allMatchList[userIndexFromMatchList] = allMatchList[userIndexFromMatchList].copyWith(interestStatus: const InterestStatus());
        allSugetionsList[userIndexFromSugessionsList] = allSugetionsList[userIndexFromSugessionsList].copyWith(interestStatus: const InterestStatus());
        allNewList[userIndexFromNewList] = allMatchList[userIndexFromNewList].copyWith(interestStatus: const InterestStatus());

        emit(
          state.copyWith(intrestStatus: StatusSuccess(), allMatchList: allMatchList, sugesstionsList: allSugetionsList, newMatchList: allNewList, profileData: profileData),
        );
      } else {
        emit(state.copyWith(
          intrestStatus: StatusFailure(res.message ?? ""),
        ));
      }
    } on ApiFailure catch (e) {
      emit(state.copyWith(intrestStatus: StatusFailure(e.error!)));
    }
  }

  FutureOr<void> _acceptRejectIntrest(AcceptRejectIntrestEvent event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(
          intrestStatus: const StatusInitial(),
        ),
      );

      emit(
        state.copyWith(
          intrestStatus: StatusLoading(),
        ),
      );

      final res = await _iHomeRepository.acceptRejectIntrest(senderId: event.senderID, status: event.status);

      if (res.respCode == 1) {
        List<UserData> allMatchList = state.allMatchList;
        List<UserData> allSugetionsList = state.sugesstionsList;
        List<UserData> allNewList = state.newMatchList;

        final int userIndexFromMatchList = state.allMatchList.indexWhere((user) => user.id.toString() == event.senderID.toString());
        final int userIndexFromSugessionsList = state.sugesstionsList.indexWhere((user) => user.id.toString() == event.senderID.toString());
        final int userIndexFromNewList = state.newMatchList.indexWhere((user) => user.id.toString() == event.senderID.toString());
        final InterestStatus interestStatus = InterestStatus(interestStatus: event.status, reciever: int.parse(event.currentUserID), sender: int.parse(event.senderID));
        CustomerData profileData = state.profileData;
        if (profileData.id != null) {
          profileData = profileData.copyWith(interestStatus: interestStatus);
        }
        allMatchList[userIndexFromMatchList] = allMatchList[userIndexFromMatchList].copyWith(interestStatus: interestStatus);
        allSugetionsList[userIndexFromSugessionsList] = allSugetionsList[userIndexFromSugessionsList].copyWith(interestStatus: interestStatus);
        allNewList[userIndexFromNewList] = allMatchList[userIndexFromNewList].copyWith(interestStatus: interestStatus);

        emit(
          state.copyWith(intrestStatus: StatusSuccess(), allMatchList: allMatchList, sugesstionsList: allSugetionsList, newMatchList: allNewList, profileData: profileData),
        );
      } else {
        emit(state.copyWith(
          intrestStatus: StatusFailure(res.message ?? ""),
        ));
      }
    } on ApiFailure catch (e) {
      emit(state.copyWith(intrestStatus: StatusFailure(e.error!)));
    }
  }

  FutureOr<void> _createIntrest(CreateIntrestEvent event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(
          intrestStatus: const StatusInitial(),
        ),
      );

      emit(
        state.copyWith(
          intrestStatus: StatusLoading(),
        ),
      );

      final res = await _iHomeRepository.sendIntrest(reciverID: event.reciverId);

      if (res.respCode == 1) {
        List<UserData> allMatchList = state.allMatchList;
        List<UserData> allSugetionsList = state.sugesstionsList;
        List<UserData> allNewList = state.newMatchList;

        final int userIndexFromMatchList = state.allMatchList.indexWhere((user) => user.id.toString() == event.reciverId.toString());
        final int userIndexFromSugessionsList = state.sugesstionsList.indexWhere((user) => user.id.toString() == event.reciverId.toString());
        final int userIndexFromNewList = state.newMatchList.indexWhere((user) => user.id.toString() == event.reciverId.toString());
        final InterestStatus interestStatus = InterestStatus(interestStatus: "pending", reciever: int.parse(event.reciverId), sender: int.parse(event.senderID));
        CustomerData profileData = state.profileData;
        if (profileData.id != null) {
          profileData = profileData.copyWith(interestStatus: interestStatus);
        }
        allMatchList[userIndexFromMatchList] = allMatchList[userIndexFromMatchList].copyWith(interestStatus: interestStatus);
        allSugetionsList[userIndexFromSugessionsList] = allSugetionsList[userIndexFromSugessionsList].copyWith(interestStatus: interestStatus);
        allNewList[userIndexFromNewList] = allMatchList[userIndexFromNewList].copyWith(interestStatus: interestStatus);

        emit(
          state.copyWith(intrestStatus: StatusSuccess(), allMatchList: allMatchList, sugesstionsList: allSugetionsList, newMatchList: allNewList, profileData: profileData),
        );
      } else {
        emit(state.copyWith(
          intrestStatus: StatusFailure(res.message ?? ""),
        ));
      }
    } on ApiFailure catch (e) {
      emit(state.copyWith(intrestStatus: StatusFailure(e.error!)));
    }
  }

  FutureOr<void> _loadProfile(LoadProfileEvent event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(loadProfileStatus: const StatusInitial(), profileData: const CustomerData()),
      );

      emit(
        state.copyWith(
          loadProfileStatus: StatusLoading(),
        ),
      );

      final res = await _iHomeRepository.loadProfile(profileId: event.profileId);
      if (res.respCode == 1) {
        emit(state.copyWith(
          loadProfileStatus: StatusSuccess(),
          profileData: res.customerData,
        ));
      } else {
        emit(state.copyWith(
          loadProfileStatus: StatusFailure(res.message ?? ""),
          profileData: const CustomerData(),
        ));
      }
    } on ApiFailure catch (e) {
      emit(state.copyWith(loadProfileStatus: StatusFailure(e.error!)));
    }
  }

  FutureOr<void> _loadSugessionsMatches(LoadAllSugetionsEvent event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(sugesstionsListStatus: const StatusInitial(), sugesstionsList: const []),
      );

      emit(
        state.copyWith(
          sugesstionsListStatus: StatusLoading(),
        ),
      );

      final res = await _iHomeRepository.loadSugessionsMatches();
      if (res.respCode == 1) {
        emit(state.copyWith(
          sugesstionsListStatus: StatusSuccess(),
          sugesstionsList: res.data ?? [],
        ));
      } else {
        emit(state.copyWith(
          sugesstionsListStatus: StatusFailure(res.message ?? ""),
          sugesstionsList: [],
        ));
      }
    } on ApiFailure catch (e) {
      emit(state.copyWith(sugesstionsListStatus: StatusFailure(e.error!)));
    }
  }

  FutureOr<void> _loadNewMatches(LoadNewMatchesEvent event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(newMatchStatus: const StatusInitial(), newMatchList: const []),
      );

      emit(
        state.copyWith(
          newMatchStatus: StatusLoading(),
        ),
      );

      final res = await _iHomeRepository.loadNewMatches();
      if (res.respCode == 1) {
        emit(state.copyWith(
          newMatchStatus: StatusSuccess(),
          newMatchList: res.data ?? [],
        ));
      } else {
        emit(state.copyWith(
          newMatchStatus: StatusFailure(res.message ?? ""),
          newMatchList: [],
        ));
      }
    } on ApiFailure catch (e) {
      emit(state.copyWith(newMatchStatus: StatusFailure(e.error!)));
    }
  }

  FutureOr<void> _loadMatches(LoadAllMatchesEvent event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(allMatchStatus: const StatusInitial(), allMatchList: const []),
      );

      emit(
        state.copyWith(
          allMatchStatus: StatusLoading(),
        ),
      );

      final res = await _iHomeRepository.loadAllMatches();
      if (res.respCode == 1) {
        emit(state.copyWith(
          allMatchStatus: StatusSuccess(),
          allMatchList: res.data ?? [],
        ));
      } else {
        emit(state.copyWith(
          allMatchStatus: StatusFailure(res.message ?? ""),
          allMatchList: [],
        ));
      }
    } on ApiFailure catch (e) {
      emit(state.copyWith(allMatchStatus: StatusFailure(e.error!)));
    }
  }

  FutureOr<void> _shortlistUser(ShortListEvent event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(
          shortListUserStatus: const StatusInitial(),
        ),
      );

      emit(
        state.copyWith(
          shortListUserStatus: StatusLoading(),
        ),
      );

      final res = await _iHomeRepository.shortListUser(profileId: event.profileId, create: event.create);
      emit(state.copyWith(
        refreshShortListItem: const StatusInitial(),
      ));
      if (res.respCode == 1) {
        List<UserData> allMatchList = state.allMatchList;
        List<UserData> allSugetionsList = state.sugesstionsList;
        List<UserData> allNewList = state.newMatchList;
        CustomerData profileData = const CustomerData();
        if (state.profileData.id != null) {
          profileData = state.profileData;
          profileData = profileData.copyWith(shortListed: (profileData.shortListed ?? false) ? false : true);
        }

        final int userIndexFromMatchList = state.allMatchList.indexWhere((user) => user.id.toString() == event.profileId.toString());
        final int userIndexFromSugessionsList = state.sugesstionsList.indexWhere((user) => user.id.toString() == event.profileId.toString());
        final int userIndexFromNewList = state.newMatchList.indexWhere((user) => user.id.toString() == event.profileId.toString());

        if (userIndexFromMatchList != -1) {
          final user = state.allMatchList[userIndexFromMatchList];
          allMatchList[userIndexFromMatchList] = user.copyWith(shortListed: (state.allMatchList[userIndexFromMatchList].shortListed ?? false) ? false : true);
        }
        if (userIndexFromSugessionsList != -1) {
          final user = state.sugesstionsList[userIndexFromSugessionsList];
          allSugetionsList[userIndexFromSugessionsList] = user.copyWith(shortListed: (state.sugesstionsList[userIndexFromSugessionsList].shortListed ?? false) ? false : true);
        }
        if (userIndexFromNewList != -1) {
          final user = state.newMatchList[userIndexFromNewList];
          allNewList[userIndexFromNewList] = user.copyWith(shortListed: (state.newMatchList[userIndexFromNewList].shortListed ?? false) ? false : true);
        }

        emit(state.copyWith(allMatchList: allMatchList, sugesstionsList: allSugetionsList, newMatchList: allNewList, refreshShortListItem: StatusSuccess(), shortListUserStatus: StatusSuccess(), commonResponse: res, profileData: profileData));
      } else {
        emit(state.copyWith(
          shortListUserStatus: StatusFailure(res.message ?? ""),
        ));
      }
    } on ApiFailure catch (e) {
      emit(state.copyWith(shortListUserStatus: StatusFailure(e.error!)));
    }
  }
}
