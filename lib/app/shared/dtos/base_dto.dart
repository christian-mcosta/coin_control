import 'package:coin_control/app/shared/stores/base_store.dart';
import 'package:uuid/uuid.dart';

class BaseDto {
  String id;
  DateTime? dataHoraCriado;
  DateTime? dataHoraDeletado;
  DateTime? dataHoraUltimaAlteracao;

  BaseDto({
    required this.id,
    this.dataHoraCriado,
    this.dataHoraDeletado,
    this.dataHoraUltimaAlteracao,
  });

  factory BaseDto.fromMap(Map<String, dynamic> map) => BaseDto(
    id: map['id'],
    dataHoraCriado: map['data_hora_criado'] != null ? DateTime.parse(map['data_hora_criado']) : DateTime.now(),
    dataHoraDeletado: map['data_hora_deletado'] != null ? DateTime.parse(map['data_hora_deletado']) : null,
    dataHoraUltimaAlteracao: map['data_hora_ultima_alteracao'] != null ? DateTime.parse(map['data_hora_ultima_alteracao']) : null,
  );

  factory BaseDto.novo() => BaseDto(id: const Uuid().v1());

  bool get isDeleted => dataHoraDeletado != null;

  bool get isNew => dataHoraCriado == null;

  BaseDto clone() {
    return BaseDto(
      id: id,
      dataHoraCriado: dataHoraCriado,
      dataHoraUltimaAlteracao: dataHoraUltimaAlteracao,
      dataHoraDeletado: dataHoraDeletado,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'data_hora_criado': dataHoraCriado?.toIso8601String(),
    'data_hora_ultima_alteracao': dataHoraUltimaAlteracao?.toIso8601String(),
    'data_hora_deletado': dataHoraDeletado?.toIso8601String(),
  };

  BaseStore toStore() {
    return BaseStore(
      id: id,
      dataHoraCriado: dataHoraCriado,
      dataHoraUltimaAlteracao: dataHoraUltimaAlteracao,
      dataHoraDeletado: dataHoraDeletado,
    );
  }
}
