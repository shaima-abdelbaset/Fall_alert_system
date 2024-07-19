import 'package:equatable/equatable.dart';
import 'package:fall_detection/feature/home/data/models/home_screen_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeScreenModel> alerts;

  const HomeLoaded(this.alerts);

  @override
  List<Object> get props => [alerts];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState(this.message);

  @override
  List<Object> get props => [message];
}
