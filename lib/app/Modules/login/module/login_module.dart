import 'package:coin_control/app/Modules/dashboard/module/dashboard_module.dart';
import 'package:coin_control/app/Modules/login/page/login_page.dart';
import 'package:coin_control/app/Modules/login/widgets/select_theme.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
     i.add<LoginPage>(LoginPage.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (context) => LoginPage());
    r.child('/select-theme', child: (context) => const SelectThema());
  }
}
