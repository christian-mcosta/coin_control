import 'package:coin_control/app/app_module.dart';
import 'package:coin_control/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    await Supabase.initialize(
        url: 'https://trfzkcwhhayajpbosdtl.supabase.co',  // URL API Supabase
        anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRyZnprY3doaGF5YWpwYm9zZHRsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjUyOTIzMTAsImV4cCI6MjA0MDg2ODMxMH0.QmgEioHgmpE7H9JTrQxJbs5jviQuAJtf5G6kWP6cVhc', //Chave anônima
      );


    return runApp(ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ));
  } catch (e) {
    throw Exception("Erro ao inicializar o aplicativo: $e");
  }
}
