part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadAllMatchesEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ShortListEvent extends HomeEvent {
  final String profileId;
  final String create;

  ShortListEvent({required this.profileId, required this.create});
  @override
  List<Object> get props => [
        profileId,
        create,
      ];
}

class LoadAllSugetionsEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class LoadNewMatchesEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class LoadProfileEvent extends HomeEvent {
  final String profileId;

  LoadProfileEvent({required this.profileId});
  @override
  List<Object> get props => [profileId];
}

class CreateIntrestEvent extends HomeEvent {
  final String reciverId;
  final String senderID;

  CreateIntrestEvent({required this.reciverId, required this.senderID});
  @override
  List<Object> get props => [reciverId, senderID];
}

class AcceptRejectIntrestEvent extends HomeEvent {
  final String status;
  final String senderID;
  final String currentUserID;

  AcceptRejectIntrestEvent({required this.status, required this.senderID, required this.currentUserID});
  @override
  List<Object> get props => [senderID, status, currentUserID];
}

class UndoIntrestEvent extends HomeEvent {
  final String recieverID;

  UndoIntrestEvent({required this.recieverID});
  @override
  List<Object> get props => [recieverID];
}
