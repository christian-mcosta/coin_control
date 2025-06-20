import 'package:coin_control/app/Modules/app_config/repositories/app_config_repository_local.dart';
import 'package:coin_control/app/Modules/app_config/repositories/app_config_repository_local_interface.dart';
import 'package:coin_control/app/Modules/app_config/services/app_config_service.dart';
import 'package:coin_control/app/Modules/app_config/services/app_config_service_interface.dart';
import 'package:coin_control/app/Modules/dashboard/module/dashboard_module.dart';
import 'package:coin_control/app/Modules/login/module/login_module.dart';
import 'package:coin_control/app/app_controller.dart';
import 'package:coin_control/app/shared/database/remote_database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppModule extends Module {

  @override
  void binds(i) {
    i.add<IAppConfigRepositoryLocal>(AppConfigRepositoryLocal.new);
    i.add<IAppConfigService>(AppConfigService.new);
    i.addSingleton<AppController>(AppController.new);

    i.addLazySingleton<RemoteDatabase>(RemoteDatabase.new);
    i.addSingleton<SupabaseClient>(() => Supabase.instance.client);
  }

  @override
  void routes(RouteManager r) {
    // r.module(
    //   Modular.initialRoute,
    //   module: DashboardModule(),
    // );
    r.module(Modular.initialRoute, module: LoginModule());
    r.module('/dashboard', module: DashboardModule());
  }
}
