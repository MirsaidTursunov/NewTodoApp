part of 'add_event_bloc.dart';

abstract class AddEventEvent extends Equatable {
  const AddEventEvent();
}

class UpdateStateEvent extends AddEventEvent {
  const UpdateStateEvent();

  @override
  List<Object?> get props => [];
}
