import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.pink),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.pink,
              secondary: Colors.white,
            ),
      ),
      initialRoute: '/',
    ).modular();
  }
}
