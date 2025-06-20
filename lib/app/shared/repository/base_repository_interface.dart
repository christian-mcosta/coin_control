import 'package:coin_control/app/shared/dtos/base_dto_interface.dart';

abstract class IBaseRepository<T extends IBaseDto> {
  Future<List<T>> getAll();

  Future<T?> getById(String id);

  Future<void> insert(T dto);

  Future<void> update(T dto);

  Future<void> delete(String id);
}
