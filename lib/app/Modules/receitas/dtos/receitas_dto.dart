import 'package:coin_control/app/shared/dtos/base_dto.dart';
import 'package:coin_control/app/shared/dtos/base_dto_interface.dart';
import 'package:flutter/material.dart';

class ReceitasDto implements IBaseDto {
  @override
  BaseDto baseDto;

  String? nomeDto;

  double valorDto;

  String? mesRecebimentoDto;

  bool receitaFixaDto;

  Image? imagemDto;

  ReceitasDto({
    required this.baseDto,
    this.nomeDto,
    required this.valorDto,
    this.mesRecebimentoDto,
    required this.receitaFixaDto,
    this.imagemDto,
  });

  factory ReceitasDto.fromMap(Map<String, dynamic> map, bool isDespesa) => ReceitasDto(
    baseDto: BaseDto.fromMap(map),
    nomeDto: map['nome'],
    valorDto: map['valor'],
    mesRecebimentoDto:  map['mes_recebimento'],
    receitaFixaDto: map['receita_fixa'],
    imagemDto: map['imagem'],
  );

  @override
  Map<String, dynamic> toMap() => {
    ...baseDto.toMap(),
    'nome': nomeDto,
    'valor': valorDto,
    'mes_recebimento': mesRecebimentoDto?.toString(),
    'receita_fixa': receitaFixaDto,
    'imagem': imagemDto,
  };
}