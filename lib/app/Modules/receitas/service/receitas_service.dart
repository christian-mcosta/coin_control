import 'package:coin_control/app/Modules/receitas/dtos/receitas_dto.dart';
import 'package:coin_control/app/Modules/receitas/repository/receitas_repository_interface.dart';
import 'package:coin_control/app/Modules/receitas/service/receitas_service_interface.dart';
import 'package:coin_control/app/shared/services/base_service.dart';

class ReceitasService extends BaseService<ReceitasDto, IReceitasRepository> implements IReceitasService {
  ReceitasService(super.repository);

  @override
  Future<List<ReceitasDto>> getAllReceitas() async => await repository.getAllReceitas();

  @override
  Future<ReceitasDto?> getByIdReceitas(String id) async => await repository.getReceitasById(id);

}