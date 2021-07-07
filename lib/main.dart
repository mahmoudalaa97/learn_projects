import 'package:flutter/material.dart';
import 'package:learn_projects/ui/router/app_router.dart';
import 'package:learn_projects/utils/colors.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColorLight: MyColors.white,
        accentColor: MyColors.white,
        primaryColor: MyColors.agateBlue,
        inputDecorationTheme: InputDecorationTheme(
          focusColor: MyColors.white
        )
      ),
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 375,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1200, name: TABLET),
          ]),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

