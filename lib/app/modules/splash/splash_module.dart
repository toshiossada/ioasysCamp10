import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/splash/splash_controller.dart';
import 'presentation/pages/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => SplashController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const SplashPage(),
    ),
  ];
}
