import 'package:flutter/material.dart';
import 'package:learn_projects/ui/start_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
      builder: (context, child) =>
          ResponsiveWrapper.builder(child,
              maxWidth:2460,
              minWidth: 450,
              defaultScale: true,
              breakpoints: [
        ResponsiveBreakpoint.resize(450, name: MOBILE),
        ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ResponsiveBreakpoint.autoScale(1000, name: TABLET),
        ResponsiveBreakpoint.resize(1200, name: DESKTOP,scaleFactor: 1.4),
        ResponsiveBreakpoint.autoScale(2460, name: "4K"),
      ]),
    );
  }
}
