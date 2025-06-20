import 'package:flutter/material.dart';

abstract class IAppConfigService {
  Future<void> salvarThema(ThemeMode theme);

  Future<ThemeMode> buscarThema();

}