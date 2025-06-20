import 'package:coin_control/app/Modules/dashboard/dtos/dashboard_dto.dart';
import 'package:coin_control/app/Modules/dashboard/repository/dashboard_repository_interface.dart';
import 'package:coin_control/app/Modules/dashboard/service/dashboard_service_interface.dart';
import 'package:coin_control/app/shared/services/base_service.dart';

class DashboardService extends BaseService<DashboardDto, IDashboardRepository> implements IDashboardService {
  DashboardService(super.repository);

  @override
  Future<List<DashboardDto>> getTransacoes(String mesSelecionado) async => await repository.getTransacoes(mesSelecionado);

}
