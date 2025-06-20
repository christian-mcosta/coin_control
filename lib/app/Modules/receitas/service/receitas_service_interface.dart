import 'package:coin_control/app/Modules/receitas/dtos/receitas_dto.dart';
import 'package:coin_control/app/shared/services/base_service_interface.dart';

abstract class IReceitasService extends IBaseService<ReceitasDto> {
  Future<List<ReceitasDto>> getAllReceitas();

  Future<ReceitasDto?> getByIdReceitas(String id);
}
