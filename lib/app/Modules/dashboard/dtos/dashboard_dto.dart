import 'package:coin_control/app/shared/dtos/base_dto.dart';
import 'package:coin_control/app/shared/dtos/base_dto_interface.dart';

class DashboardDto implements IBaseDto {
  @override
  BaseDto baseDto;

  final String nome;

  final String mes;

  final double valor;

  final bool isDespesa; // true = despesa, false = receita

  DashboardDto({
    required this.baseDto,
    required this.nome,
    required this.mes,
    required this.valor,
    required this.isDespesa,
  });

  factory DashboardDto.fromMap(Map<String, dynamic> map) => DashboardDto(
    baseDto: BaseDto.fromMap(map),
    nome: map['nome'],
    mes: map['mes'],
    valor: map['valor'],
    isDespesa: map['is_despesa'],
  );

  @override
  Map<String, dynamic> toMap() => {
    ...baseDto.toMap(),
    'nome': nome,
    'mes': mes,
    'valor': valor,
    'is_despesa': isDespesa,
  };
}
