import 'package:coin_control/app/Modules/despesas/dtos/despesas_dto.dart';
import 'package:coin_control/app/Modules/despesas/service/despesas_service_interface.dart';
import 'package:coin_control/app/Modules/despesas/stores/despesas_store.dart';
import 'package:mobx/mobx.dart';

part 'despesas_controller.g.dart';

class DespesasController = _DespesasControllerBase with _$DespesasController;

abstract class _DespesasControllerBase with Store {
  final IDespesasService despesasService;

  _DespesasControllerBase(this.despesasService);

  @observable
  DespesasStore despesasStore = DespesasStore();

  @observable
  ObservableList<DespesasStore> despesas = ObservableList<DespesasStore>();

  @observable
  String? errorMessage;

  @action
  Future<void> loadDespesas() async {
    try {
      final List<DespesasDto> result = await despesasService.getAllDespesas();

      despesas.clear();

      final despesasFiltradas = result.where((despesa) => despesa.baseDto.dataHoraDeletado == null).map((e) => DespesasStoreFactory.fromDto(e)).toList();

      despesas.addAll(despesasFiltradas);

      errorMessage = null;
    } catch (e, stackTrace) {
      errorMessage = 'Erro ao carregar despesas: ${e.toString()}\nStackTrace: $stackTrace';
    }
  }

  @action
  Future<void> getAll() async {
    try {
      final List<DespesasDto> result = await despesasService.getAllDespesas();

      final List<DespesasStore> despesasFiltradas = result.where((despesa) => despesa.baseDto.dataHoraDeletado == null).map((e) => DespesasStoreFactory.fromDto(e)).toList();

      despesas = ObservableList.of(despesasFiltradas);
      errorMessage = null;
    } catch (e, stackTrace) {
      errorMessage = 'Erro ao buscar todas as despesas: ${e.toString()}\nStackTrace: $stackTrace';
    }
  }

  @action
  Future<void> insert(DespesasStore despesa) async {
    try {
      await despesasService.insert(despesa.toDto());
      getAll();
    } catch (e, stackTrace) {
      errorMessage = 'Erro ao inserir despesa: ${e.toString()}\nStackTrace: $stackTrace';
    }
  }

  @action
  Future<void> update(DespesasStore despesa) async {
    try {
      await despesasService.update(despesa.toDto());
      await getAll();
    } catch (e, stackTrace) {
      errorMessage = 'Erro ao atualizar despesa: ${e.toString()}\nStackTrace: $stackTrace';
    }
  }

  @action
  Future<void> delete(String id) async {
    try {
      await despesasService.delete(id);
      await getAll();
    } catch (e, stackTrace) {
      errorMessage = 'Erro ao deletar despesa: ${e.toString()}\nStackTrace: $stackTrace';
    }
  }
}
