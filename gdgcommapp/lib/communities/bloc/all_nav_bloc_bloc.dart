import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'all_nav_bloc_event.dart';
part 'all_nav_bloc_state.dart';

class AllNavBlocBloc extends Bloc<AllNavBlocEvent, AllNavBlocState> {
  AllNavBlocBloc() : super(const AllNavBlocInitialState()) {
    on<LoadHomeEvent>(_loadHomeEvent);
    on<CommunityChanged>(_communityChanged);
  }

  void _communityChanged(
      CommunityChanged event, Emitter<AllNavBlocState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(CommunityUpdated(event.stateName));
    if (event.stateName == 'Aba') {
      await Future.delayed(const Duration(seconds: 2));
      emit(AbaClickedState());
    } else if (event.stateName == 'Lagos') {
      await Future.delayed(const Duration(seconds: 2));
      emit(LagosClickedState());
    } else if (event.stateName == 'Port Harcourt') {
      await Future.delayed(const Duration(seconds: 2));
      emit(PortHarcourtClickedState());
    } else if (event.stateName == 'Uyo') {
      await Future.delayed(const Duration(seconds: 2));
      emit(UyoClickedState());
    } else if (event.stateName == 'Enugu') {
      await Future.delayed(const Duration(seconds: 2));
      emit(EnuguClickedState());
    } else {
      await Future.delayed(const Duration(seconds: 2));
      emit(AllClickedState());
    }
  }

  void _loadHomeEvent(
      LoadHomeEvent event, Emitter<AllNavBlocState> emit) async {
    emit(const LoadHomeState(status: HomeStatus.initial));
    await Future.delayed(const Duration(seconds: 3));
    emit(const LoadHomeState(status: HomeStatus.loaded));
  }
}
