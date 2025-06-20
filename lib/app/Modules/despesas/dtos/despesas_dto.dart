import 'package:coin_control/app/shared/dtos/base_dto.dart';
import 'package:coin_control/app/shared/dtos/base_dto_interface.dart';
import 'package:flutter/material.dart';

class DespesasDto implements IBaseDto {
  @override
  BaseDto baseDto;

  String? nomeDto;

  double valorDto;

  String? mesVencimentoDto;

  int quantidadeParcelasDto;

  bool despesaFixaDto;

  Image? imagemDto;

  DespesasDto({
    required this.baseDto,
    this.nomeDto,
    required this.valorDto,
    this.mesVencimentoDto,
    required this.quantidadeParcelasDto,
    required this.despesaFixaDto,
    this.imagemDto,
  });

  factory DespesasDto.fromMap(Map<String, dynamic> map, bool isDespesa) => DespesasDto(
    baseDto: BaseDto.fromMap(map),
    nomeDto: map['nome'],
    valorDto: map['valor'],
    mesVencimentoDto: map['mes_vencimento'],
    quantidadeParcelasDto: map['quantidade_parcelas'],
    despesaFixaDto: map['despesa_fixa'],
    imagemDto: map['imagem'],
  );

  @override
  Map<String, dynamic> toMap() => {
    ...baseDto.toMap(),
    'nome': nomeDto,
    'valor': valorDto,
    'mes_vencimento': mesVencimentoDto,
    'quantidade_parcelas': quantidadeParcelasDto,
    'despesa_fixa': despesaFixaDto,
    'imagem': imagemDto,
  };
}