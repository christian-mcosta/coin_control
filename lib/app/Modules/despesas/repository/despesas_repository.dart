import 'package:coin_control/app/Modules/despesas/dtos/despesas_dto.dart';
import 'package:coin_control/app/Modules/despesas/repository/despesas_repository_interface.dart';
import 'package:coin_control/app/shared/database/remote_database.dart';
import 'package:coin_control/app/shared/repository/base_repository.dart';

class DespesasRepository extends BaseRepository<DespesasDto> implements IDespesasRepository {
  final RemoteDatabase _remoteDatabase;

  DespesasRepository(this._remoteDatabase) : super(_remoteDatabase);

  @override
  String get table => 'despesas';

  @override
  Future<List<DespesasDto>> getAllDespesas() async {
    final data = await _remoteDatabase.query('despesas');
    return data.map((e) => DespesasDto.fromMap(e, true)).toList();
  }

  @override
  Future<DespesasDto?> getDespesaById(String id) async {
    final data = await _remoteDatabase.queryById('despesas', id: 'id');
    return data!.isNotEmpty ? DespesasDto.fromMap(data, true) : null;
  }

  @override
  DespesasDto fromMap(Map<String, dynamic> map, bool isDespesa) {
    return DespesasDto.fromMap(map, true);
  }
}
