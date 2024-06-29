part of 'all_nav_bloc_bloc.dart';

@immutable
sealed class AllNavBlocEvent extends Equatable {
  const AllNavBlocEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeEvent extends AllNavBlocEvent {}

class LagosClickedEvent extends AllNavBlocEvent {}

class AbaClickedEvent extends AllNavBlocEvent {}

class CommunityChanged extends AllNavBlocEvent {
  final String stateName;

  const CommunityChanged(
    this.stateName,
  );

  List<String> get props => [stateName];
}
