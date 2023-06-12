import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_todo_app/constants/theme/app_colors.dart';
import 'package:new_todo_app/constants/utils/app_utils.dart';
import 'package:new_todo_app/features/add_event/bloc/add_event_bloc.dart';
import 'package:new_todo_app/features/add_event/page/mixins/add_tasks_mixin.dart';
import 'package:new_todo_app/features/add_event/widgets/custom_text_field.dart';
import 'package:new_todo_app/features/home/data/data_source/local_source.dart';
import 'package:new_todo_app/features/home/data/floor/entity/tasks.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> with AddTasksMixin {
  @override
  void initState() {
    super.initState();
    initControllers();
  }

  @override
  void dispose() {
    super.dispose();
    disposeControllers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEventBloc, AddEventState>(
      builder: (_, state) {
        return StreamBuilder<List<Tasks>>(
            stream: LocalSource.getInstance().getTasks(),
            builder: (context, snapshot) {
              return Scaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: AppUtils.kPaddingAll16,
                  child: ListView(
                    children: [
                      CustomTextField(
                        title: "Event name",
                        controller: nameController,
                        maxLines: 3,
                      ),
                      AppUtils.kBoxHeight16,
                      CustomTextField(
                        title: "Event description",
                        controller: descriptionController,
                        maxLines: 10,
                        minLines: 6,
                      ),
                      AppUtils.kBoxHeight16,
                      CustomTextField(
                        title: "Event location",
                        controller: locationController,
                        suffixIcon: const Icon(
                          Icons.location_on_rounded,
                          color: AppColors.mainBlue,
                        ),
                      ),
                      AppUtils.kBoxHeight16,
                      const Text('Priority color'),
                      AppUtils.kBoxHeight6,
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showMenu(
                                context: context,
                                position: RelativeRect.fromLTRB(
                                  16,
                                  MediaQuery.of(context).size.height - 280,
                                  16,
                                  0,
                                ),
                                items: colorItems.map((colorItem) {
                                  return PopupMenuItem<ColorItem>(
                                    value: colorItem,
                                    child: Container(
                                      height: 20,
                                      width: 75,
                                      color: colorItem.color,
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                            borderRadius: AppUtils.kBorderRadius8,
                            child: Ink(
                              padding: AppUtils.kHorizontal9Vertical6Padding,
                              decoration: const BoxDecoration(
                                color: AppColors.grey100,
                                borderRadius: AppUtils.kBorderRadius8,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 23,
                                    color: AppColors.red.withOpacity(0.2),
                                  ),
                                  AppUtils.kBoxWidth12,
                                  const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.mainBlue,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppUtils.kBoxHeight16,
                      CustomTextField(
                        title: "Event time",
                        controller: timeController,
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: SafeArea(
                  minimum: AppUtils.kPaddingAll16,
                  child: MaterialButton(
                    onPressed: () {
                      if (nameController.text.isNotEmpty ||
                          descriptionController.text.isNotEmpty) {
                        LocalSource.getInstance().insertTask(
                          Tasks(
                              nameTask: nameController.text,
                              descriptionTask: descriptionController.text,
                              locationTask: locationController.text,
                              timeTask: timeController.text,
                              colorTask: 'mainBlue'),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: AppColors.orange,
                            content: Text('Please write event'),
                            duration: Duration(milliseconds: 150),
                          ),
                        );
                      }
                    },
                    height: 46,
                    color: AppColors.mainBlue,
                    textColor: AppColors.white,
                    highlightElevation: 0,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: AppUtils.kBorderRadius10),
                    child: const Text(
                      'Add',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}

class ColorItem {
  final String name;
  final Color color;

  ColorItem({required this.name, required this.color});
}
