import 'package:coin_control/app/Modules/despesas/controller/despesas_controller.dart';
import 'package:coin_control/app/Modules/despesas/page/despesas_page.dart';
import 'package:coin_control/app/Modules/despesas/repository/despesas_repository.dart';
import 'package:coin_control/app/Modules/despesas/repository/despesas_repository_interface.dart';
import 'package:coin_control/app/Modules/despesas/service/despesas_service.dart';
import 'package:coin_control/app/Modules/despesas/service/despesas_service_interface.dart';
import 'package:coin_control/app/shared/database/remote_database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DespesasModule extends Module {
  @override
  void binds(Injector i) {
    i.add<IDespesasRepository>(DespesasRepository.new);
    i.add<IDespesasService>(DespesasService.new);
    i.add(DespesasController.new);

    i.addLazySingleton<RemoteDatabase>(RemoteDatabase.new);
    i.addSingleton<SupabaseClient>(() => Supabase.instance.client);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const DespesasPage());
  }
}
