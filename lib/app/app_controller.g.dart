// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on _AppControllerBase, Store {
  Computed<ThemeMode>? _$themeComputed;

  @override
  ThemeMode get theme =>
      (_$themeComputed ??= Computed<ThemeMode>(() => super.theme,
              name: '_AppControllerBase.theme'))
          .value;

  late final _$_themeAtom =
      Atom(name: '_AppControllerBase._theme', context: context);

  @override
  ThemeMode get _theme {
    _$_themeAtom.reportRead();
    return super._theme;
  }

  @override
  set _theme(ThemeMode value) {
    _$_themeAtom.reportWrite(value, super._theme, () {
      super._theme = value;
    });
  }

  late final _$setThemeAsyncAction =
      AsyncAction('_AppControllerBase.setTheme', context: context);

  @override
  Future<void> setTheme({required Brightness brightness}) {
    return _$setThemeAsyncAction
        .run(() => super.setTheme(brightness: brightness));
  }

  @override
  String toString() {
    return '''
theme: ${theme}
    ''';
  }
}
