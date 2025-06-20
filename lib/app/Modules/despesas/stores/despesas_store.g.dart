// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DespesasStore on _DespesasStore, Store {
  late final _$baseAtom = Atom(name: '_DespesasStore.base', context: context);

  @override
  BaseStore? get base {
    _$baseAtom.reportRead();
    return super.base;
  }

  @override
  set base(BaseStore? value) {
    _$baseAtom.reportWrite(value, super.base, () {
      super.base = value;
    });
  }

  late final _$nomeAtom = Atom(name: '_DespesasStore.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$valorAtom = Atom(name: '_DespesasStore.valor', context: context);

  @override
  double? get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(double? value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  late final _$mesVencimentoAtom =
      Atom(name: '_DespesasStore.mesVencimento', context: context);

  @override
  String? get mesVencimento {
    _$mesVencimentoAtom.reportRead();
    return super.mesVencimento;
  }

  @override
  set mesVencimento(String? value) {
    _$mesVencimentoAtom.reportWrite(value, super.mesVencimento, () {
      super.mesVencimento = value;
    });
  }

  late final _$quantidadeParcelasAtom =
      Atom(name: '_DespesasStore.quantidadeParcelas', context: context);

  @override
  int? get quantidadeParcelas {
    _$quantidadeParcelasAtom.reportRead();
    return super.quantidadeParcelas;
  }

  @override
  set quantidadeParcelas(int? value) {
    _$quantidadeParcelasAtom.reportWrite(value, super.quantidadeParcelas, () {
      super.quantidadeParcelas = value;
    });
  }

  late final _$despesaFixaAtom =
      Atom(name: '_DespesasStore.despesaFixa', context: context);

  @override
  bool? get despesaFixa {
    _$despesaFixaAtom.reportRead();
    return super.despesaFixa;
  }

  @override
  set despesaFixa(bool? value) {
    _$despesaFixaAtom.reportWrite(value, super.despesaFixa, () {
      super.despesaFixa = value;
    });
  }

  late final _$imagemAtom =
      Atom(name: '_DespesasStore.imagem', context: context);

  @override
  Image? get imagem {
    _$imagemAtom.reportRead();
    return super.imagem;
  }

  @override
  set imagem(Image? value) {
    _$imagemAtom.reportWrite(value, super.imagem, () {
      super.imagem = value;
    });
  }

  late final _$_DespesasStoreActionController =
      ActionController(name: '_DespesasStore', context: context);

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_DespesasStoreActionController.startAction(
        name: '_DespesasStore.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_DespesasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMesVencimento(String value) {
    final _$actionInfo = _$_DespesasStoreActionController.startAction(
        name: '_DespesasStore.setMesVencimento');
    try {
      return super.setMesVencimento(value);
    } finally {
      _$_DespesasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuantidadeParcelas(int value) {
    final _$actionInfo = _$_DespesasStoreActionController.startAction(
        name: '_DespesasStore.setQuantidadeParcelas');
    try {
      return super.setQuantidadeParcelas(value);
    } finally {
      _$_DespesasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDespesaFixa(bool value) {
    final _$actionInfo = _$_DespesasStoreActionController.startAction(
        name: '_DespesasStore.setDespesaFixa');
    try {
      return super.setDespesaFixa(value);
    } finally {
      _$_DespesasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImagem(Image value) {
    final _$actionInfo = _$_DespesasStoreActionController.startAction(
        name: '_DespesasStore.setImagem');
    try {
      return super.setImagem(value);
    } finally {
      _$_DespesasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValor(double value) {
    final _$actionInfo = _$_DespesasStoreActionController.startAction(
        name: '_DespesasStore.setValor');
    try {
      return super.setValor(value);
    } finally {
      _$_DespesasStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
base: ${base},
nome: ${nome},
valor: ${valor},
mesVencimento: ${mesVencimento},
quantidadeParcelas: ${quantidadeParcelas},
despesaFixa: ${despesaFixa},
imagem: ${imagem}
    ''';
  }
}
