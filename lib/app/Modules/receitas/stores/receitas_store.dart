import 'package:coin_control/app/Modules/receitas/dtos/receitas_dto.dart';
import 'package:coin_control/app/shared/stores/base_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'receitas_store.g.dart';

class ReceitasStore = _ReceitasStore with _$ReceitasStore;

abstract class ReceitasStoreFactory {
  static ReceitasStore fromDto(ReceitasDto dto) => ReceitasStore(
    base: dto.baseDto.toStore(),
    nome: dto.nomeDto,
    valor: dto.valorDto,
    mesRecebimento: dto.mesRecebimentoDto,
    receitaFixa: dto.receitaFixaDto,
    imagem: dto.imagemDto,
  );
}

abstract class _ReceitasStore with Store {
  @observable
  BaseStore base;

  @observable
  String? nome;

  @observable
  double valor;

  @observable
  String? mesRecebimento;

  @observable
  bool receitaFixa;

  @observable
  Image? imagem;

  _ReceitasStore({
    required this.base,
    this.nome,
    required this.valor,
    this.mesRecebimento,
    required this.receitaFixa,
    this.imagem,
  });

  ReceitasDto toDto() => ReceitasDto(
        baseDto: base.toDto(),
        nomeDto: nome,
        valorDto: valor,
        mesRecebimentoDto: mesRecebimento,
        receitaFixaDto: receitaFixa,
        imagemDto: imagem,
      );
}
