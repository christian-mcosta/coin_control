import 'package:coin_control/app/Modules/dashboard/dtos/dashboard_dto.dart';
import 'package:coin_control/app/shared/services/base_service_interface.dart';

abstract class IDashboardService extends IBaseService<DashboardDto> {

  Future<List<DashboardDto>> getTransacoes(String id);

}