// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DespesasController on _DespesasControllerBase, Store {
  late final _$despesasStoreAtom =
      Atom(name: '_DespesasControllerBase.despesasStore', context: context);

  @override
  DespesasStore get despesasStore {
    _$despesasStoreAtom.reportRead();
    return super.despesasStore;
  }

  @override
  set despesasStore(DespesasStore value) {
    _$despesasStoreAtom.reportWrite(value, super.despesasStore, () {
      super.despesasStore = value;
    });
  }

  late final _$despesasAtom =
      Atom(name: '_DespesasControllerBase.despesas', context: context);

  @override
  ObservableList<DespesasStore> get despesas {
    _$despesasAtom.reportRead();
    return super.despesas;
  }

  @override
  set despesas(ObservableList<DespesasStore> value) {
    _$despesasAtom.reportWrite(value, super.despesas, () {
      super.despesas = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_DespesasControllerBase.errorMessage', context: context);

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
      AsyncAction('_DespesasControllerBase.loadDespesas', context: context);

  @override
  Future<void> loadDespesas() {
    return _$loadDespesasAsyncAction.run(() => super.loadDespesas());
  }

  late final _$getAllAsyncAction =
      AsyncAction('_DespesasControllerBase.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  late final _$insertAsyncAction =
      AsyncAction('_DespesasControllerBase.insert', context: context);

  @override
  Future<void> insert(DespesasStore despesa) {
    return _$insertAsyncAction.run(() => super.insert(despesa));
  }

  late final _$updateAsyncAction =
      AsyncAction('_DespesasControllerBase.update', context: context);

  @override
  Future<void> update(DespesasStore despesa) {
    return _$updateAsyncAction.run(() => super.update(despesa));
  }

  late final _$deleteAsyncAction =
      AsyncAction('_DespesasControllerBase.delete', context: context);

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
despesasStore: ${despesasStore},
despesas: ${despesas},
errorMessage: ${errorMessage}
    ''';
  }
}
