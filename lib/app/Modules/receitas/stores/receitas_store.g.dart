// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receitas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReceitasStore on _ReceitasStore, Store {
  late final _$baseAtom = Atom(name: '_ReceitasStore.base', context: context);

  @override
  BaseStore get base {
    _$baseAtom.reportRead();
    return super.base;
  }

  @override
  set base(BaseStore value) {
    _$baseAtom.reportWrite(value, super.base, () {
      super.base = value;
    });
  }

  late final _$nomeAtom = Atom(name: '_ReceitasStore.nome', context: context);

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

  late final _$valorAtom = Atom(name: '_ReceitasStore.valor', context: context);

  @override
  double get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(double value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  late final _$mesRecebimentoAtom =
      Atom(name: '_ReceitasStore.mesRecebimento', context: context);

  @override
  String? get mesRecebimento {
    _$mesRecebimentoAtom.reportRead();
    return super.mesRecebimento;
  }

  @override
  set mesRecebimento(String? value) {
    _$mesRecebimentoAtom.reportWrite(value, super.mesRecebimento, () {
      super.mesRecebimento = value;
    });
  }

  late final _$receitaFixaAtom =
      Atom(name: '_ReceitasStore.receitaFixa', context: context);

  @override
  bool get receitaFixa {
    _$receitaFixaAtom.reportRead();
    return super.receitaFixa;
  }

  @override
  set receitaFixa(bool value) {
    _$receitaFixaAtom.reportWrite(value, super.receitaFixa, () {
      super.receitaFixa = value;
    });
  }

  late final _$imagemAtom =
      Atom(name: '_ReceitasStore.imagem', context: context);

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

  @override
  String toString() {
    return '''
base: ${base},
nome: ${nome},
valor: ${valor},
mesRecebimento: ${mesRecebimento},
receitaFixa: ${receitaFixa},
imagem: ${imagem}
    ''';
  }
}
