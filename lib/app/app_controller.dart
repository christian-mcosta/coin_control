import 'package:coin_control/app/Modules/app_config/services/app_config_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final IAppConfigService _appConfigService;

  @observable
  ThemeMode _theme = ThemeMode.system;

  @computed
  ThemeMode get theme => _theme;

  _AppControllerBase(this._appConfigService) {
    _init();
  }

  Future<void> _init() async {
    await _loadTheme();
  }

  Future<void> _loadTheme() async {
    _theme = await _appConfigService.buscarThema();
  }

  @action
  Future<void> setTheme({required Brightness brightness}) async {
    final theme = brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
    _theme = theme;
    await _appConfigService.salvarThema(theme);
  }
}
