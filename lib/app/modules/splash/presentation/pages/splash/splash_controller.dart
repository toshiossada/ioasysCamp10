import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  SplashController();

  Future<void> init() async {
    Future.delayed(const Duration(seconds: 2), () {
      Modular.to.pushReplacementNamed('/converter');
    });
  }
}
