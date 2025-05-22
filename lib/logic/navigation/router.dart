import 'package:budget_tracker/logic/navigation/routes.dart';
import 'package:budget_tracker/main.dart';
import 'package:budget_tracker/ui/screens/new_transaction.dart';
import 'package:budget_tracker/ui/screens/statistics.dart';
import 'package:budget_tracker/ui/screens/transactions_history.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route buildRoute(
    Widget widget, {
    RouteSettings? settings,
    bool useFadeAnim = false,
  }) {
    if (useFadeAnim) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          final tween = Tween(begin: begin, end: end);
          final opacityAnimation = animation.drive(tween);

          return FadeTransition(
            opacity: opacityAnimation,
            child: child,
          );
        },
      );
    }
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }

  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    Route route(
      Widget widget, {
      bool useFadeAnim = false,
    }) =>
        buildRoute(
          widget,
          settings: settings,
          useFadeAnim: useFadeAnim,
        );

    switch (settings.name) {
      case Routes.initialPage:
        return route(const InitialPage());
      case Routes.newTransaction:
        return route(const NewTransactionPage());
      case Routes.transactionsHistory:
        return route(const TransactionsHistory());
      case Routes.statistics:
        return route(const Statistics());
      default:
        return route(const InitialPage());
    }
  }
}
