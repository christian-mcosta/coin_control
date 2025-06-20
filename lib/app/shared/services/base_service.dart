import 'package:coin_control/app/shared/dtos/base_dto_interface.dart';
import 'package:coin_control/app/shared/repository/base_repository_interface.dart';
import 'package:coin_control/app/shared/services/base_service_interface.dart';

abstract class BaseService<T extends IBaseDto, Y extends IBaseRepository<T>> implements IBaseService<T> {
  final Y repository;

  BaseService(this.repository);

  @override
  Future<List<T>> getAll() async => await repository.getAll();

  @override
  Future<T?> getById(String id) async => await repository.getById(id);

  @override
  Future<void> insert(T dto) async => await repository.insert(dto);

  @override
  Future<void> update(T dto) async => await repository.update(dto);

  @override
  Future<void> delete(String id) async => await repository.delete(id);
}
