part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
}

class UpdateStateEvent extends DetailsEvent {
  const UpdateStateEvent();

  @override
  List<Object?> get props => [];
}
