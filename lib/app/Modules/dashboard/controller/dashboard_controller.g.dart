// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardController on _DashboardControllerBase, Store {
  late final _$carregarTransacoesAsyncAction = AsyncAction(
      '_DashboardControllerBase.carregarTransacoes',
      context: context);

  @override
  Future<void> carregarTransacoes() {
    return _$carregarTransacoesAsyncAction
        .run(() => super.carregarTransacoes());
  }

  late final _$selecionarMesAsyncAction =
      AsyncAction('_DashboardControllerBase.selecionarMes', context: context);

  @override
  Future<void> selecionarMes(String mes) {
    return _$selecionarMesAsyncAction.run(() => super.selecionarMes(mes));
  }

  late final _$_DashboardControllerBaseActionController =
      ActionController(name: '_DashboardControllerBase', context: context);

  @override
  void calcularTotais() {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.calcularTotais');
    try {
      return super.calcularTotais();
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
