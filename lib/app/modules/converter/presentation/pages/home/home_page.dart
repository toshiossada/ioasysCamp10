import 'package:aula9/app/modules/converter/presentation/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import 'widgets/custom_text_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          key: const Key('btnLogoAppBar'),
          onTap: () {
            Modular.to.pushNamed('/converter/about');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        title: Text('title_home'.i18n()),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Icon(
              Icons.attach_money,
              size: MediaQuery.of(context).size.height * 0.188,
            ),
            CustomTextFieldWidget(
              key: const Key('txtBrl'),
              labelText: 'brl'.i18n(),
              prefix: 'brl_symbol'.i18n(),
              controller: controller.txtReais,
              onChanged: controller.onRealChanged,
            ),
            CustomTextFieldWidget(
              key: const Key('txtUsd'),
              labelText: 'usd'.i18n(),
              prefix: 'usd_symbol'.i18n(),
              controller: controller.txtDolars,
              onChanged: controller.onDolarChanged,
            ),
            CustomTextFieldWidget(
              key: const Key('txtEur'),
              labelText: 'eur'.i18n(),
              prefix: 'eur_symbol'.i18n(),
              controller: controller.txtEuros,
              onChanged: controller.onEuroChanged,
            ),
            ValueListenableBuilder<bool>(
              builder: (context, value, child) {
                return Visibility(
                  visible: value,
                  child: child!,
                );
              },
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
              ),
              valueListenable: controller.homeStore,
            ),
          ],
        ),
      ),
    );
  }
}
