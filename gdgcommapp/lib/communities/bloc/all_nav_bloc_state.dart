part of 'all_nav_bloc_bloc.dart';

enum HomeStatus { initial, loaded, error }

@immutable
sealed class AllNavBlocState extends Equatable {
  const AllNavBlocState();
  List<Object?> get props => [];

  // void add(LagosClickedEvent lagosClickedEvent) {}

  // AllNavBlocInitialState copyWith({required HomeStatus status}) {}
}

final class AllNavBlocInitialState extends AllNavBlocState {
  // final HomeStatus status;
  const AllNavBlocInitialState();

  // copyWith({required HomeStatus status}) {}
}

class LoadHomeState extends AllNavBlocState {
  final HomeStatus status;

  const LoadHomeState({this.status = HomeStatus.initial});
}

class CommunityUpdated extends AllNavBlocState {
  final String communityName;

  const CommunityUpdated(
    this.communityName,
  );

  List<String> get props => [communityName];
}

class AbaClickedState extends AllNavBlocState {}

class LagosClickedState extends AllNavBlocState {}

class PortHarcourtClickedState extends AllNavBlocState {}

class UyoClickedState extends AllNavBlocState {}

class EnuguClickedState extends AllNavBlocState {}

class AllClickedState extends AllNavBlocState {}
