import 'package:coin_control/app/Modules/despesas/dtos/despesas_dto.dart';
import 'package:coin_control/app/shared/stores/base_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'despesas_store.g.dart';

class DespesasStore = _DespesasStore with _$DespesasStore;

abstract class DespesasStoreFactory {
  static DespesasStore fromDto(DespesasDto dto) => DespesasStore(
    base: dto.baseDto.toStore(),
    nome: dto.nomeDto,
    valor: dto.valorDto,
    mesVencimento: dto.mesVencimentoDto,
    quantidadeParcelas: dto.quantidadeParcelasDto,
    despesaFixa: dto.despesaFixaDto,
    imagem: dto.imagemDto,
      );
}

abstract class _DespesasStore with Store{

  @observable
  BaseStore? base;

  @observable
  String? nome;

  @observable
  double? valor;

  @observable
  String? mesVencimento;

  @observable
  int? quantidadeParcelas;

  @observable
  bool? despesaFixa;

  @observable
  Image? imagem;

  _DespesasStore({
    this.base,
    this.nome,
    this.valor,
    this.mesVencimento,
    this.quantidadeParcelas,
    this.despesaFixa,
    this.imagem,
  });

  @action
  setNome(String value) => nome = value;

  @action
  setMesVencimento(String value) => mesVencimento = value;

  @action
  setQuantidadeParcelas(int value) => quantidadeParcelas = value;

  @action
  setDespesaFixa(bool value) => despesaFixa = value;

  @action
  setImagem(Image value) => imagem = value;

  @action
  setValor(double value) => valor = value;

  DespesasDto toDto() => DespesasDto(
        baseDto: base!.toDto(),
        nomeDto: nome,
        valorDto: valor ?? 0.0,
        mesVencimentoDto: mesVencimento,
        quantidadeParcelasDto: quantidadeParcelas ?? 0,
        despesaFixaDto: despesaFixa ?? false,
        imagemDto: imagem,
      );
}
