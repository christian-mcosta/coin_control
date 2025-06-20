import 'package:coin_control/app/Modules/receitas/dtos/receitas_dto.dart';
import 'package:coin_control/app/shared/repository/base_repository_interface.dart';

abstract class IReceitasRepository extends IBaseRepository<ReceitasDto>{
  @override
  Future<List<ReceitasDto>> getAllReceitas();

  Future<ReceitasDto?> getReceitasById(String id);

}
