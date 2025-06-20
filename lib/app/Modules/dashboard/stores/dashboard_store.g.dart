// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardStore on _DashboardStore, Store {
  late final _$transacoesAtom =
      Atom(name: '_DashboardStore.transacoes', context: context);

  @override
  ObservableList<DashboardDto> get transacoes {
    _$transacoesAtom.reportRead();
    return super.transacoes;
  }

  @override
  set transacoes(ObservableList<DashboardDto> value) {
    _$transacoesAtom.reportWrite(value, super.transacoes, () {
      super.transacoes = value;
    });
  }

  late final _$mesSelecionadoAtom =
      Atom(name: '_DashboardStore.mesSelecionado', context: context);

  @override
  String get mesSelecionado {
    _$mesSelecionadoAtom.reportRead();
    return super.mesSelecionado;
  }

  @override
  set mesSelecionado(String value) {
    _$mesSelecionadoAtom.reportWrite(value, super.mesSelecionado, () {
      super.mesSelecionado = value;
    });
  }

  late final _$totalRendaAtom =
      Atom(name: '_DashboardStore.totalRenda', context: context);

  @override
  double get totalRenda {
    _$totalRendaAtom.reportRead();
    return super.totalRenda;
  }

  @override
  set totalRenda(double value) {
    _$totalRendaAtom.reportWrite(value, super.totalRenda, () {
      super.totalRenda = value;
    });
  }

  late final _$totalDespesaAtom =
      Atom(name: '_DashboardStore.totalDespesa', context: context);

  @override
  double get totalDespesa {
    _$totalDespesaAtom.reportRead();
    return super.totalDespesa;
  }

  @override
  set totalDespesa(double value) {
    _$totalDespesaAtom.reportWrite(value, super.totalDespesa, () {
      super.totalDespesa = value;
    });
  }

  late final _$totalDisponivelAtom =
      Atom(name: '_DashboardStore.totalDisponivel', context: context);

  @override
  double get totalDisponivel {
    _$totalDisponivelAtom.reportRead();
    return super.totalDisponivel;
  }

  @override
  set totalDisponivel(double value) {
    _$totalDisponivelAtom.reportWrite(value, super.totalDisponivel, () {
      super.totalDisponivel = value;
    });
  }

  @override
  String toString() {
    return '''
transacoes: ${transacoes},
mesSelecionado: ${mesSelecionado},
totalRenda: ${totalRenda},
totalDespesa: ${totalDespesa},
totalDisponivel: ${totalDisponivel}
    ''';
  }
}
