import 'dart:async';
import 'dart:ui';

import 'package:localization/localization.dart';

class LocalizationHelper {
  Future<void> configuration(List<String> paths) async {
    Localization.setTranslationDirectories(paths);

    var language = window.locale.toString();

    await Localization.configuration(
      selectedLanguage: language,
      showDebugPrintMode: false,
    );
  }
}
