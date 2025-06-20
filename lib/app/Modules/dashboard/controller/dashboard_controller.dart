import 'package:coin_control/app/Modules/dashboard/service/dashboard_service_interface.dart';
import 'package:coin_control/app/Modules/dashboard/stores/dashboard_store.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final IDashboardService service;
  final DashboardStore dashboardStore;

  _DashboardControllerBase(this.service, this.dashboardStore);

  @action
  Future<void> carregarTransacoes() async {
    try {
      final listaTransacoes = await service.getTransacoes(dashboardStore.mesSelecionado);
      dashboardStore.transacoes.clear();
      dashboardStore.transacoes.addAll(listaTransacoes);

      print('Transações carregadas: ${dashboardStore.transacoes.length}');
      for (var t in dashboardStore.transacoes) {
        print('Transação: ${t.nome}, Valor: ${t.valor}, Tipo: ${t.isDespesa ? 'Despesa' : 'Receita'}, Mês: ${t.mes}');
      }

      calcularTotais();
    } catch (e) {
      print('Erro ao carregar transações: $e');
    }
  }

  @action
  void calcularTotais() {
    dashboardStore.totalRenda = dashboardStore.transacoes
        .where((t) => !t.isDespesa)
        .fold(0.0, (total, t) => total + t.valor);

    dashboardStore.totalDespesa = dashboardStore.transacoes
        .where((t) => t.isDespesa)
        .fold(0.0, (total, t) => total + t.valor);

    dashboardStore.totalDisponivel = dashboardStore.totalRenda - dashboardStore.totalDespesa;
  }

  @action
  Future<void> selecionarMes(String mes) async {
    dashboardStore.mesSelecionado = mes;
    await carregarTransacoes();
  }
}
