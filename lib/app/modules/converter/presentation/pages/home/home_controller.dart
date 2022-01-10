import 'dart:async';
import 'dart:developer';
import 'package:aula9/app/modules/converter/domain/enums/currency_type_enum.dart';
import 'package:intl/intl.dart';

import 'package:aula9/app/modules/converter/domain/usecases/convert_currency.dart';
import 'package:aula9/app/modules/converter/presentation/pages/home/home_store.dart';
import 'package:flutter/material.dart';

class HomeController {
  final IConvertCurrency _convertCurrency;
  final HomeStore homeStore;

  final txtReais = TextEditingController();
  final txtDolars = TextEditingController();
  final txtEuros = TextEditingController();
  Timer? _debounce;

  HomeController({
    required IConvertCurrency convertCurrency,
    required this.homeStore,
  }) : _convertCurrency = convertCurrency;

  _search(String value, CurrencyTypeEnum type) {
    homeStore.setLoad(true);
    if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      NumberFormat formatter = NumberFormat.currency(symbol: '');
      try {
        if (value.isNotEmpty) {
          var currencies = await _convertCurrency(value, type);

          if ((type != CurrencyTypeEnum.usd)) {
            txtDolars.text = formatter.format(currencies.dollar);
          }
          if ((type != CurrencyTypeEnum.brl)) {
            txtReais.text = formatter.format(currencies.real);
          }
          if ((type != CurrencyTypeEnum.eur)) {
            txtEuros.text = formatter.format(currencies.euro);
          }
        } else {
          txtDolars.text = '';
          txtReais.text = '';
          txtEuros.text = '';
        }
      } catch (e, s) {
        log(
          'Erro ao converter valor: $value',
          error: e,
          stackTrace: s
        );
      } finally {
        homeStore.setLoad(false);
      }
    });
  }

  convertCurrency() {}
  Future onRealChanged(String v) async {
    _search(v, CurrencyTypeEnum.brl);
  }

  Future onDolarChanged(String v) async {
    _search(v, CurrencyTypeEnum.usd);
  }

  Future onEuroChanged(String v) async {
    _search(v, CurrencyTypeEnum.eur);
  }
}
