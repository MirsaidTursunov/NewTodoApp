part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class UpdateStateEvent extends HomeEvent {
  const UpdateStateEvent();

  @override
  List<Object?> get props => [];
}
