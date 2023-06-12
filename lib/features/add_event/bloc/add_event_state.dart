part of 'add_event_bloc.dart';

class AddEventState extends Equatable {
  final DateTime? dateResult;
  final String? date;

  const AddEventState({
    this.dateResult,
    this.date,
  });

  AddEventState copyWith({
    String? date,
  }) {
    return AddEventState(
      dateResult: dateResult,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [
        dateResult,
        date,
      ];
}
