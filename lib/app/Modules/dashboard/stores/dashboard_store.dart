import 'package:coin_control/app/Modules/dashboard/dtos/dashboard_dto.dart';
import 'package:coin_control/app/Modules/dashboard/service/dashboard_service_interface.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store {
  final IDashboardService service;

  _DashboardStore(this.service);

  @observable
  ObservableList<DashboardDto> transacoes = ObservableList<DashboardDto>();

  @observable
  String mesSelecionado = '';

  @observable
  double totalRenda = 0.0;

  @observable
  double totalDespesa = 0.0;

  @observable
  double totalDisponivel = 0.0;
}
