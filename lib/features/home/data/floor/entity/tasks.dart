import 'package:floor/floor.dart';

@entity
class Tasks {
  @primaryKey
  String nameTask;
  String descriptionTask;
  String locationTask;
  String timeTask;
  String colorTask;

  Tasks({
    required this.nameTask,
    required this.descriptionTask,
    required this.locationTask,
    required this.timeTask,
    required this.colorTask,
  });
}
