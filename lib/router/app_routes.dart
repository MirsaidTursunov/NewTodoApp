import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_todo_app/features/add_event/bloc/add_event_bloc.dart';
import 'package:new_todo_app/features/add_event/page/add_event_page.dart';
import 'package:new_todo_app/features/details_event/bloc/details_bloc.dart';
import 'package:new_todo_app/features/details_event/page/details_event_page.dart';
import 'package:new_todo_app/features/home/presentation/page/home_page.dart';
import 'name_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('route : ${settings.name}');
    }
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.addEventPage:
        final AddPageArguments args = settings.arguments as AddPageArguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AddEventBloc(),
            child: AddEventPage(
              args: args,
            ),
          ),
        );
      case Routes.detailsEventPage:
        final DetailPageArguments args =
            settings.arguments as DetailPageArguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DetailsBloc(),
            child: DetailsEventPage(
              args: args,
            ),
          ),
        );
    }
    return null;
  }
}

PageRouteBuilder buildPageWithDefaultTransition<T>({required Widget child}) {
  return PageRouteBuilder<T>(
    pageBuilder: (_, __, ___) => child,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
