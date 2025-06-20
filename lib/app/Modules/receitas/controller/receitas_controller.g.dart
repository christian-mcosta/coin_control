// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receitas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReceitasController on _ReceitasControllerBase, Store {
  late final _$receitasAtom =
      Atom(name: '_ReceitasControllerBase.receitas', context: context);

  @override
  ObservableList<ReceitasStore> get receitas {
    _$receitasAtom.reportRead();
    return super.receitas;
  }

  @override
  set receitas(ObservableList<ReceitasStore> value) {
    _$receitasAtom.reportWrite(value, super.receitas, () {
      super.receitas = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_ReceitasControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loadDespesasAsyncAction =
      AsyncAction('_ReceitasControllerBase.loadDespesas', context: context);

  @override
  Future<void> loadDespesas() {
    return _$loadDespesasAsyncAction.run(() => super.loadDespesas());
  }

  late final _$getAllAsyncAction =
      AsyncAction('_ReceitasControllerBase.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$insertAsyncAction =
      AsyncAction('_ReceitasControllerBase.insert', context: context);

  @override
  Future<void> insert(ReceitasStore receita) {
    return _$insertAsyncAction.run(() => super.insert(receita));
  }

  late final _$updateAsyncAction =
      AsyncAction('_ReceitasControllerBase.update', context: context);

  @override
  Future<void> update(ReceitasStore receita) {
    return _$updateAsyncAction.run(() => super.update(receita));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_ReceitasControllerBase.delete', context: context);

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
receitas: ${receitas},
errorMessage: ${errorMessage}
    ''';
  }
}
