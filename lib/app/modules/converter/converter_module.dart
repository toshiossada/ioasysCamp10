import 'package:aula9/app/modules/converter/domain/usecases/convert_currency.dart';
import 'package:aula9/app/modules/converter/infra/datasources/currency_datasource.dart';
import 'package:aula9/app/modules/converter/infra/repositories/currency_repository.dart';
import 'package:aula9/app/modules/converter/presentation/pages/home/home_controller.dart';
import 'package:aula9/app/modules/converter/presentation/pages/home/home_page.dart';
import 'package:aula9/app/modules/converter/presentation/pages/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/currency_repository_interface.dart';
import 'infra/repositories/datasources/currency_datasource_interface.dart';
import 'presentation/pages/about/about_page.dart';

class ConverterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<ICurrencyDataSource>(
        (i) => CurrencyDataSource(httpClient: i())),
    Bind.factory<ICurrencyRepository>(
        (i) => CurrencyRepository(currencyDataSource: i())),
    Bind.factory<IConvertCurrency>(
        (i) => ConvertCurrency(currencyRepository: i())),
    Bind.factory((i) => HomeStore()),
    Bind.factory((i) => HomeController(homeStore: i(), convertCurrency: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const HomePage()),
    ChildRoute('/about',
        child: (context, args) => const AboutPage()),
  ];
}
