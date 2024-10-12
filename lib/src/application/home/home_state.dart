part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status allMatchStatus, sugesstionsListStatus, newMatchStatus, shortListUserStatus, refreshShortListItem, loadProfileStatus, intrestStatus;
  final List<UserData> allMatchList;
  final List<UserData> newMatchList;
  final List<UserData> sugesstionsList;
  final CustomerData profileData;
  final CommonResponse commonResponse;
  const HomeState({
    this.intrestStatus = const StatusInitial(),
    this.loadProfileStatus = const StatusInitial(),
    this.profileData = const CustomerData(),
    this.allMatchStatus = const StatusInitial(),
    this.sugesstionsListStatus = const StatusInitial(),
    this.newMatchStatus = const StatusInitial(),
    this.newMatchList = const [],
    this.sugesstionsList = const [],
    this.allMatchList = const [],
    this.commonResponse = const CommonResponse(),
    this.refreshShortListItem = const StatusInitial(),
    this.shortListUserStatus = const StatusInitial(),
  });

  @override
  List<Object> get props => [intrestStatus, sugesstionsList, sugesstionsListStatus, newMatchStatus, newMatchList, allMatchStatus, allMatchList, shortListUserStatus, refreshShortListItem, commonResponse, profileData, loadProfileStatus];

  HomeState copyWith(
      {Status? loadProfileStatus,
      Status? intrestStatus,
      CustomerData? profileData,
      Status? sugesstionsListStatus,
      Status? newMatchStatus,
      List<UserData>? newMatchList,
      List<UserData>? sugesstionsList,
      CommonResponse? commonResponse,
      Status? allMatchStatus,
      List<UserData>? allMatchList,
      Status? shortListUserStatus,
      Status? refreshShortListItem}) {
    return HomeState(
        intrestStatus: intrestStatus ?? this.intrestStatus,
        loadProfileStatus: loadProfileStatus ?? this.loadProfileStatus,
        profileData: profileData ?? this.profileData,
        newMatchStatus: newMatchStatus ?? this.newMatchStatus,
        sugesstionsListStatus: sugesstionsListStatus ?? this.sugesstionsListStatus,
        newMatchList: newMatchList ?? this.newMatchList,
        sugesstionsList: sugesstionsList ?? this.sugesstionsList,
        commonResponse: commonResponse ?? this.commonResponse,
        refreshShortListItem: refreshShortListItem ?? this.refreshShortListItem,
        shortListUserStatus: shortListUserStatus ?? this.shortListUserStatus,
        allMatchList: allMatchList ?? this.allMatchList,
        allMatchStatus: allMatchStatus ?? this.allMatchStatus);
  }
}
