import 'package:flutter/material.dart';
import 'package:new_todo_app/constants/theme/app_colors.dart';
import 'package:new_todo_app/features/add_event/page/add_event_page.dart';

mixin AddTasksMixin  on State<AddEventPage>{
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController locationController;
  late TextEditingController timeController;
  ColorItem? selectedColor;
  final List<ColorItem> colorItems = [
    ColorItem(name: 'mainBlue', color: AppColors.mainBlue),
    ColorItem(name: 'red', color: AppColors.red),
    ColorItem(name: 'orange', color: AppColors.orange),
  ];

  void initControllers() {
    nameController = TextEditingController(text: widget.args?.taskItem?.nameTask);
    descriptionController = TextEditingController(text: widget.args?.taskItem?.descriptionTask);
    locationController = TextEditingController(text: widget.args?.taskItem?.locationTask);
    timeController = TextEditingController(text: widget.args?.taskItem?.timeTask);
  }

  void disposeControllers(){
    nameController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    timeController.dispose();
  }
}