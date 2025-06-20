import 'package:coin_control/app/Modules/app_config/repositories/app_config_repository_local.dart';
import 'package:coin_control/app/Modules/app_config/repositories/app_config_repository_local_interface.dart';
import 'package:coin_control/app/Modules/app_config/services/app_config_service.dart';
import 'package:coin_control/app/Modules/app_config/services/app_config_service_interface.dart';
import 'package:coin_control/app/Modules/dashboard/controller/dashboard_controller.dart';
import 'package:coin_control/app/Modules/dashboard/page/dashboard_page.dart';
import 'package:coin_control/app/Modules/dashboard/repository/dashboard_repository.dart';
import 'package:coin_control/app/Modules/dashboard/repository/dashboard_repository_interface.dart';
import 'package:coin_control/app/Modules/dashboard/service/dashboard_service.dart';
import 'package:coin_control/app/Modules/dashboard/service/dashboard_service_interface.dart';
import 'package:coin_control/app/Modules/dashboard/stores/dashboard_store.dart';
import 'package:coin_control/app/Modules/despesas/module/despesas_module.dart';
import 'package:coin_control/app/Modules/login/module/login_module.dart';
import 'package:coin_control/app/Modules/receitas/module/receitas_module.dart';
import 'package:coin_control/app/shared/database/remote_database.dart';
import 'package:coin_control/app/shared/routes/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardModule extends Module {
  @override
  List<Module> get imports => [
        LoginModule(),
        DespesasModule(),
        ReceitasModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<IAppConfigRepositoryLocal>(AppConfigRepositoryLocal.new);
    i.add<IAppConfigService>(AppConfigService.new);

    i.add<IDashboardRepository>(DashboardRepository.new);
    i.add<IDashboardService>(DashboardService.new);
    i.addLazySingleton<DashboardController>(DashboardController.new);
    i.add<DashboardStore>(DashboardStore.new);
    i.addLazySingleton<RemoteDatabase>(RemoteDatabase.new);
    i.addSingleton<SupabaseClient>(() => Supabase.instance.client);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => DashboardPage());
    r.module('/$despesasRoute', module: DespesasModule());
    r.module('/$receitasRoute', module: ReceitasModule());
  }
}
