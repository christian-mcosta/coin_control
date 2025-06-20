
import 'package:coin_control/app/Modules/receitas/dtos/receitas_dto.dart';
import 'package:coin_control/app/Modules/receitas/service/receitas_service_interface.dart';
import 'package:coin_control/app/Modules/receitas/stores/receitas_store.dart';
import 'package:coin_control/app/shared/stores/base_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'receitas_controller.g.dart';

class ReceitasController = _ReceitasControllerBase with _$ReceitasController;

abstract class _ReceitasControllerBase with Store {
  final IReceitasService receitasService;

  _ReceitasControllerBase(this.receitasService);

  @observable
  ObservableList<ReceitasStore> receitas = ObservableList<ReceitasStore>();

  @observable
  String? errorMessage;

  @action
  Future<void> loadDespesas() async {
    try {
      final List<ReceitasDto> result = await receitasService.getAllReceitas();

      receitas.clear();

      final receitasFiltradas = result.where((receita) => receita.baseDto.dataHoraDeletado == null).map((e) => ReceitasStoreFactory.fromDto(e)).toList();

      receitas.addAll(receitasFiltradas);

      errorMessage = null;
    } catch (e, stackTrace) {
      errorMessage = 'Erro ao carregar despesas: ${e.toString()}\nStackTrace: $stackTrace';
    }
  }

  @action
  Future<void> getAll() async {
    try {
      final List<ReceitasDto> result = await receitasService.getAllReceitas();

      final List<ReceitasStore> receitasFiltradas = result.where((receitas) => receitas.baseDto.dataHoraDeletado == null).map((e) => ReceitasStoreFactory.fromDto(e)).toList();

      receitas = ObservableList.of(receitasFiltradas);
      errorMessage = null;
    } catch (e, stackTrace) {
      errorMessage = 'Erro ao buscar todas as despesas: ${e.toString()}\nStackTrace: $stackTrace';
    }
  }

  @action
  Future<void> insert(ReceitasStore receita) async {
    try {
      await receitasService.insert(receita.toDto());
      getAll();
    } catch (e, stackTrace) {
      errorMessage = 'Erro ao inserir despesa: ${e.toString()}\nStackTrace: $stackTrace';
    }
  }

  @action
  Future<void> update(ReceitasStore receita) async {
    try {
      await receitasService.update(receita.toDto());
      await getAll();
    } catch (e, stackTrace) {
      errorMessage = 'Erro ao atualizar despesa: ${e.toString()}\nStackTrace: $stackTrace';
    }
  }

  @action
  Future<void> delete(String id) async {
    try {
      await receitasService.delete(id);
      await getAll();
    } catch (e, stackTrace) {
      errorMessage = 'Erro ao deletar despesa: ${e.toString()}\nStackTrace: $stackTrace';
    }
  }

  ReceitasStore createReceitaStore({
    required BaseStore base,
    required String nome,
    required double valor,
    required String mesRecebimento,
    required bool receitaFixa,
    Image? imagem,
  }) {
    return ReceitasStore(
      base: base,
      nome: nome,
      valor: valor,
      mesRecebimento: mesRecebimento,
      receitaFixa: receitaFixa,
      imagem: imagem,
    );
  }
}
