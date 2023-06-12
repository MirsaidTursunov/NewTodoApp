import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:new_todo_app/constants/theme/app_colors.dart';
import 'package:new_todo_app/constants/theme/app_theme.dart';
import 'package:new_todo_app/features/home/data/floor/app_database.dart';
import 'package:new_todo_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:new_todo_app/features/home/presentation/page/home_page.dart';
import 'package:new_todo_app/router/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: KeyboardDismisser(
        child: MaterialApp(
          title: 'New Todo App',
          navigatorKey: rootNavigatorKey,
          theme: appTheme,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          home: const HomePage(),
        ),
      ),
    );
  }
}
