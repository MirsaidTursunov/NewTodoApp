part of 'home_bloc.dart';

class HomeState extends Equatable {
  final DateTime? dateResult;
  final String? date;

  const HomeState({
    this.dateResult,
    this.date,
  });

  HomeState copyWith({
    String? date,
  }) {
    return HomeState(
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
