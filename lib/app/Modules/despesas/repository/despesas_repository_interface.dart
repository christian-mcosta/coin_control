import 'package:coin_control/app/Modules/despesas/dtos/despesas_dto.dart';
import 'package:coin_control/app/shared/repository/base_repository_interface.dart';

abstract class IDespesasRepository extends IBaseRepository<DespesasDto>{
  @override
  Future<List<DespesasDto>> getAllDespesas();

  Future<DespesasDto?> getDespesaById(String id);

}
