import 'package:coin_control/app/Modules/despesas/dtos/despesas_dto.dart';
import 'package:coin_control/app/shared/services/base_service_interface.dart';

abstract class IDespesasService extends IBaseService<DespesasDto> {
  Future<List<DespesasDto>> getAllDespesas();

  Future<DespesasDto?> getByIdDespesa(String id);
}
