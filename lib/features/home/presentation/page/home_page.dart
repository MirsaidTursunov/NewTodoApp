import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_todo_app/constants/theme/app_colors.dart';
import 'package:new_todo_app/constants/theme/app_text_style.dart';
import 'package:new_todo_app/constants/utils/app_utils.dart';
import 'package:new_todo_app/constants/utils/base_utils.dart';
import 'package:new_todo_app/features/details_event/page/details_event_page.dart';
import 'package:new_todo_app/features/home/data/data_source/local_source.dart';
import 'package:new_todo_app/features/home/data/floor/entity/tasks.dart';
import 'package:new_todo_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:new_todo_app/features/home/presentation/widgets/date_picker_widget.dart';
import 'package:new_todo_app/features/home/presentation/widgets/task_item_widget.dart';
import 'package:new_todo_app/router/name_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        return StreamBuilder<List<Tasks>>(
            stream: LocalSource.getInstance().getTasks(),
            builder: (context, snapshot) {
              List<Tasks> taskList = [];
              if (snapshot.hasData) {
                taskList = (snapshot.data ?? []).reversed.toList();
              }
              return Scaffold(
                appBar: AppBar(
                  surfaceTintColor: AppColors.white,
                  centerTitle: true,
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        BaseFunction.dayFormatter(selectedDate),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              BaseFunction.dayMonthYearFormatter(selectedDate),
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w400),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 14,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 28),
                      child: Badge(
                        child:
                            SvgPicture.asset('assets/svg/ic_notification.svg'),
                      ),
                    ),
                  ],
                ),
                body: Padding(
                  padding: AppUtils.kPaddingHor28,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ColoredBox(
                        color: AppColors.white,
                        child: DatePickerWidget(
                          selectedDate: selectedDate,
                          onSelect: (DateTime date) {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                        ),
                      ),
                      ColoredBox(
                        color: AppColors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Schedule',
                              style: AppTextStyles.text14Weight600,
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.addEventPage,
                                );
                              },
                              height: 30,
                              color: AppColors.mainBlue,
                              textColor: AppColors.white,
                              highlightElevation: 0,
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: AppUtils.kBorderRadius10),
                              child: Text(
                                '+ Add Event',
                                style: AppTextStyles.text10Weight500
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: taskList.isEmpty
                            ? const Center(
                                child: Text("No Tasks"),
                              )
                            : ListView.separated(
                                itemCount: taskList.length,
                                shrinkWrap: true,
                                padding: AppUtils.kPaddingVer18,
                                itemBuilder: (context, index) {
                                  return TaskItemWidget(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.detailsEventPage,
                                        arguments: DetailPageArguments(
                                          taskItem: taskList[index],
                                        ),
                                      );
                                    },
                                    taskName: taskList[index].nameTask,
                                    description:
                                        taskList[index].descriptionTask,
                                    taskTime: taskList[index].timeTask,
                                    location: taskList[index].locationTask,
                                    taskColor: AppColors.mainBlue,
                                  );
                                },
                                separatorBuilder: (_, __) =>
                                    AppUtils.kBoxHeight14,
                              ),
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
