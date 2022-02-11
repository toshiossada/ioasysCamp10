import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = [
      'assets/lang',
      'assets/lang2/',
    ];
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // delegate from localization package.
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('pt', 'BR'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }

        // define pt_BR as default when de language code is 'pt'
        switch (locale?.languageCode) {
          case 'es':
            return const Locale('es', 'ES');
          case 'en':
            return const Locale('en', 'US');
          case 'pt':
            return const Locale('pt', 'BR');
          default:
            return const Locale('pt', 'BR');
        }
      },
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
