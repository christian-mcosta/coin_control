import 'package:coin_control/app/Modules/despesas/dtos/despesas_dto.dart';
import 'package:coin_control/app/Modules/despesas/repository/despesas_repository_interface.dart';
import 'package:coin_control/app/Modules/despesas/service/despesas_service_interface.dart';
import 'package:coin_control/app/shared/services/base_service.dart';

class DespesasService extends BaseService<DespesasDto, IDespesasRepository> implements IDespesasService {
  DespesasService(super.repository);

  @override
  Future<List<DespesasDto>> getAllDespesas() async => await repository.getAllDespesas();

  @override
  Future<DespesasDto?> getByIdDespesa(String id) async => await repository.getDespesaById(id);

}