import 'package:coin_control/app/Modules/dashboard/dtos/dashboard_dto.dart';
import 'package:coin_control/app/shared/repository/base_repository_interface.dart';

abstract class IDashboardRepository extends IBaseRepository<DashboardDto>{
  Future<List<DashboardDto>> getTransacoes(String mesSelecionado);


}
