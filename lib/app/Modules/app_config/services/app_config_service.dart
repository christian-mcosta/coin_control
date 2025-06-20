import 'package:coin_control/app/Modules/app_config/repositories/app_config_repository_local_interface.dart';
import 'package:coin_control/app/Modules/app_config/services/app_config_service_interface.dart';
import 'package:flutter/material.dart';

class AppConfigService implements IAppConfigService {
  final IAppConfigRepositoryLocal _repository;

  AppConfigService(this._repository);

  @override
  Future<void> salvarThema(ThemeMode theme) async => await _repository.salvarThema(theme);

  @override
  Future<ThemeMode> buscarThema() async => await _repository.buscarThema();

}
