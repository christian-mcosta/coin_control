import 'package:coin_control/app/shared/dtos/base_dto.dart';
import 'package:mobx/mobx.dart';

part 'base_store.g.dart';

class BaseStore = _BaseStoreBase with _$BaseStore;

abstract class _BaseStoreBase with Store {
  @observable
  String id;

  @observable
  DateTime? dataHoraCriado;

  @observable
  DateTime? dataHoraDeletado;

  @observable
  DateTime? dataHoraUltimaAlteracao;

  _BaseStoreBase({
    required this.id,
    this.dataHoraCriado,
    this.dataHoraDeletado,
    this.dataHoraUltimaAlteracao,
  });

  BaseDto toDto() {
    return BaseDto(
      id: id,
      dataHoraCriado: dataHoraCriado,
      dataHoraUltimaAlteracao: dataHoraUltimaAlteracao,
      dataHoraDeletado: dataHoraDeletado,
    );
  }
}
