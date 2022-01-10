import 'package:aula9/app/commons/adapters/localization/localization_helper.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  final LocalizationHelper _localizationHelper;

  SplashController({
    required LocalizationHelper localizationHelper,
  }) : _localizationHelper = localizationHelper;

  Future<void> init() async {
    await _localizationHelper.configuration([
      'assets/lang',
    ]);

    Future.delayed(const Duration(seconds: 2), () {
      Modular.to.pushReplacementNamed('/converter');
    });
  }
}
