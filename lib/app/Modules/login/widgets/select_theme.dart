import 'package:coin_control/app/Modules/app_config/repositories/app_config_repository_local_interface.dart';
import 'package:coin_control/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SelectThema extends StatefulWidget {
  const SelectThema({super.key});

  @override
  _SelectThemaState createState() => _SelectThemaState();
}

class _SelectThemaState extends State<SelectThema> {
  final AppController appController = Modular.get<AppController>();
  final IAppConfigRepositoryLocal configRepository = Modular.get<IAppConfigRepositoryLocal>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Configurações'),
      ),
      body: Center(
        child: Observer(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selecione o Tema:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final newMode = appController.theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                    appController.setTheme(
                      brightness: newMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
                    );
                    await configRepository.salvarThema(newMode);

                    setState(() {
                      Modular.to.navigate('/');
                    });
                  },
                  child: Text(
                    appController.theme == ThemeMode.light ? 'Tema Escuro' : 'Tema Claro',
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
