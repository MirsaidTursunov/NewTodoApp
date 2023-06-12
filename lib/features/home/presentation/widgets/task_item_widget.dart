import 'package:flutter/material.dart';
import 'package:new_todo_app/constants/theme/app_text_style.dart';
import 'package:new_todo_app/constants/utils/app_utils.dart';

class TaskItemWidget extends StatelessWidget {
  final String? taskName;
  final String? description;
  final String? taskTime;
  final String? location;
  final Color? taskColor;
  final Function()? onTap;

  const TaskItemWidget(
      {Key? key,
      required this.onTap,
      required this.taskName,
      required this.description,
      required this.taskTime,
      required this.location,
      required this.taskColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppUtils.kBorderRadius10,
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: AppUtils.kBorderRadius10,
            color: taskColor?.withOpacity(0.2)),
        child: Column(
          children: [
            Ink(
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: AppUtils.kBorderTopRadius10, color: taskColor),
            ),
            Padding(
              padding: AppUtils.kPaddingAll12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    taskName ?? '',
                    style: AppTextStyles.nameTaskStyle,
                  ),
                  Text(
                    description ?? '',
                    style: AppTextStyles.text8Weight400,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppUtils.kBoxHeight12,
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_filled_outlined,
                        size: 18,
                        color: taskColor,
                      ),
                      AppUtils.kBoxWidth6,
                      Text(
                        taskTime ?? '',
                        style: AppTextStyles.text10Weight500
                            .copyWith(color: taskColor),
                      ),
                      AppUtils.kBoxWidth12,
                      Visibility(
                        visible: location?.isNotEmpty ?? false,
                        child: Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                size: 18,
                                color: taskColor,
                              ),
                              AppUtils.kBoxWidth6,
                              Expanded(
                                child: Text(
                                  location ?? '',
                                  style: AppTextStyles.text10Weight500
                                      .copyWith(color: taskColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
