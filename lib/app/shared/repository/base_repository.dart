import 'package:coin_control/app/shared/database/remote_database.dart';
import 'package:coin_control/app/shared/dtos/base_dto_interface.dart';
import 'package:coin_control/app/shared/repository/base_repository_interface.dart';

abstract class BaseRepository<T extends IBaseDto> implements IBaseRepository<T> {
  final RemoteDatabase _remoteDatabase;

  BaseRepository(this._remoteDatabase);

  String get table;

  T fromMap(Map<String, dynamic> map, bool fromRemote);

  @override
  Future<List<T>> getAll() async {
    final data = await _remoteDatabase.query(table);
    return data.map((e) => fromMap(e, false)).toList();
  }

  @override
  Future<T?> getById(String id) async {
    final data = await _remoteDatabase.queryById(table, id: id);
    return data != null ? fromMap(data, false) : null;
  }

  @override
  Future<void> insert(T entity, {String? uri}) async {
    await _remoteDatabase.insert(table, entity.toMap());
  }

  @override
  Future<void> update(T entity) async {
    await _remoteDatabase.update(table, entity.toMap());
  }

  @override
  Future<void> delete(String id) async {
    await _remoteDatabase.delete(table, id: id);
  }
}
