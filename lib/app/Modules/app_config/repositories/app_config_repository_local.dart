import 'package:coin_control/app/Modules/app_config/repositories/app_config_repository_local_interface.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigRepositoryLocal implements IAppConfigRepositoryLocal {
  static const _keyTheme = 'app_theme';

  @override
  Future<void> salvarThema(ThemeMode theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('theme', theme.index);
  }

  @override
  Future<ThemeMode> buscarThema() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final int? theme = prefs.getInt('theme');

    if (theme != null) {
      return ThemeMode.values[theme];
    }

    return ThemeMode.system;
  }
}