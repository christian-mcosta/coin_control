import 'package:coin_control/app/Modules/receitas/dtos/receitas_dto.dart';
import 'package:coin_control/app/Modules/receitas/repository/receitas_repository_interface.dart';
import 'package:coin_control/app/shared/database/remote_database.dart';
import 'package:coin_control/app/shared/repository/base_repository.dart';

class ReceitasRepository extends BaseRepository<ReceitasDto> implements IReceitasRepository {
  final RemoteDatabase _remoteDatabase;

  ReceitasRepository(this._remoteDatabase) : super(_remoteDatabase);

  @override
  String get table => 'receitas';

  @override
  Future<List<ReceitasDto>> getAllReceitas() async {
    final data = await _remoteDatabase.query('receitas');
    return data.map((e) => ReceitasDto.fromMap(e, false)).toList();
  }

  @override
  Future<ReceitasDto?> getReceitasById(String id) async {
    final data = await _remoteDatabase.queryById('receitas', id: 'id');
    return data!.isNotEmpty ? ReceitasDto.fromMap(data, false) : null;
  }

  @override
  ReceitasDto fromMap(Map<String, dynamic> map, bool isDespesa) {
    return ReceitasDto.fromMap(map, false);
  }
}
