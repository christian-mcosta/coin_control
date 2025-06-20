import 'package:coin_control/app/Modules/dashboard/page/dashboard_page.dart';
import 'package:coin_control/app/Modules/login/page/login_page.dart';
import 'package:coin_control/app/app_controller.dart';
import 'package:coin_control/app/shared/themes/dark_theme.dart';
import 'package:coin_control/app/shared/themes/ligth_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../main.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}
class _AppWidgetState extends State<AppWidget> {
  final AppController controller = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final theme = Theme.of(context);
        return MaterialApp.router(
          title: 'Coin Control',
          supportedLocales: const [Locale('pt', 'BR')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          themeMode: controller.theme,
          theme: LightTheme.themeData(theme),
          darkTheme: DarkTheme.themeData(theme),
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        );
      }
    ); //added by extension
  }
}