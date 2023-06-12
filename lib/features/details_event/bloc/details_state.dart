part of 'details_bloc.dart';

class DetailsState extends Equatable {
  final DateTime? dateResult;
  final String? date;

  const DetailsState({
    this.dateResult,
    this.date,
  });

  DetailsState copyWith({
    String? date,
  }) {
    return DetailsState(
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
