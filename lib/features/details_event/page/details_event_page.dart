import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_todo_app/constants/theme/app_colors.dart';
import 'package:new_todo_app/constants/theme/app_text_style.dart';
import 'package:new_todo_app/constants/utils/app_utils.dart';
import 'package:new_todo_app/features/home/data/data_source/local_source.dart';
import 'package:new_todo_app/features/home/data/floor/entity/tasks.dart';

class DetailsEventPage extends StatelessWidget {
  final DetailPageArguments args;

  const DetailsEventPage({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: AppColors.mainBlue,
                borderRadius: AppUtils.kBorderBottom20),
            child: Padding(
              padding: AppUtils.kPaddingHor28,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: kTextTabBarHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset('assets/svg/ic_back.svg'),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/svg/ic_edit.svg'),
                            AppUtils.kBoxWidth6,
                            Text(
                              "Edit",
                              style: AppTextStyles.text14Weight600.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppUtils.kBoxHeight20,
                  Text(
                    args.taskItem?.nameTask ?? '',
                    style: AppTextStyles.text26Weight600,
                  ),
                  Text(
                    args.taskItem?.descriptionTask ?? '',
                    style: AppTextStyles.text8Weight400
                        .copyWith(color: AppColors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppUtils.kBoxHeight12,
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_filled_outlined,
                        size: 18,
                        color: AppColors.white,
                      ),
                      AppUtils.kBoxWidth6,
                      Text(
                        args.taskItem?.timeTask ?? '',
                        style: AppTextStyles.text10Weight500,
                      ),
                    ],
                  ),
                  AppUtils.kBoxHeight12,
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 18,
                        color: AppColors.white,
                      ),
                      AppUtils.kBoxWidth6,
                      Text(
                        args.taskItem?.locationTask ?? '',
                        style: AppTextStyles.text10Weight500,
                      ),
                    ],
                  ),
                  AppUtils.kBoxHeight20,
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: AppUtils.kPaddingHor28,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 28.0, bottom: 10),
                  child: Text(
                    'Reminder',
                    style: AppTextStyles.text16Weight600,
                  ),
                ),
                Text(
                  '15 minutes befor',
                  style: AppTextStyles.text16Weight600.copyWith(color: AppColors.grey7c, fontWeight: FontWeight.w500),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 28.0, bottom: 10),
                  child: Text(
                    'Description',
                    style: AppTextStyles.text16Weight600,
                  ),
                ),
                Text(
                  args.taskItem?.descriptionTask ?? '',
                  style: AppTextStyles.grey999Text10Weight400,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: AppUtils.kPaddingAll28,
        child: MaterialButton(
          onPressed: () {
            LocalSource.getInstance().removeTask(
              Tasks(
                nameTask: args.taskItem?.nameTask ?? '',
                descriptionTask: args.taskItem?.descriptionTask ?? '',
                locationTask: args.taskItem?.locationTask ?? '',
                timeTask: args.taskItem?.locationTask ?? '',
                colorTask: args.taskItem?.colorTask ?? '',
              ),
            );
            Navigator.pop(context);
          },
          height: 46,
          color: AppColors.red.withOpacity(0.15),
          textColor: AppColors.white,
          highlightElevation: 0,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: AppUtils.kBorderRadius10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/ic_delete.svg",
                colorFilter: const ColorFilter.mode(
                  AppColors.red,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                'Delete Event',
                style: AppTextStyles.text14Weight600
                    .copyWith(color: AppColors.black29),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPageArguments {
  final Tasks? taskItem;

  DetailPageArguments({
    this.taskItem,
  });
}
