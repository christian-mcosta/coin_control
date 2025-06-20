import 'package:coin_control/app/Modules/receitas/controller/receitas_controller.dart';
import 'package:coin_control/app/Modules/receitas/page/receitas_page.dart';
import 'package:coin_control/app/Modules/receitas/repository/receitas_repository.dart';
import 'package:coin_control/app/Modules/receitas/repository/receitas_repository_interface.dart';
import 'package:coin_control/app/Modules/receitas/service/receitas_service.dart';
import 'package:coin_control/app/Modules/receitas/service/receitas_service_interface.dart';
import 'package:coin_control/app/shared/database/remote_database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReceitasModule extends Module {
  @override
  void binds(Injector i) {
    i.add<IReceitasRepository>(ReceitasRepository.new);
    i.add<IReceitasService>(ReceitasService.new);
    i.add(ReceitasController.new);

    i.addLazySingleton<RemoteDatabase>(RemoteDatabase.new);
    i.addSingleton<SupabaseClient>(() => Supabase.instance.client);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => const ReceitasPage());
  }
}
