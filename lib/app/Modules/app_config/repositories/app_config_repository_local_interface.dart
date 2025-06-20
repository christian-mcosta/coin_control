import 'package:flutter/material.dart';

abstract class IAppConfigRepositoryLocal {
  Future<void> salvarThema(ThemeMode theme);

  Future<ThemeMode> buscarThema();
}