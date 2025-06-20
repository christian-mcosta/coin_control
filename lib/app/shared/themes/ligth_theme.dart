import 'package:coin_control/app/shared/themes/fonts.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static Color get _textColor => Colors.grey.shade900;
  static Color get _disabledTextColor => Colors.grey.shade500;

  static themeData(ThemeData theme, {bool isEnabled = true}) => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    dividerTheme: DividerThemeData(
      space: 0,
      color: Colors.grey.shade300,
      thickness: 1,
    ),
    fontFamily: POPPINS_FONT,
    colorScheme: _fromSeedColorScheme,
    appBarTheme: AppBarTheme(
      iconTheme: theme.iconTheme.copyWith(color: Colors.black87),
      backgroundColor: _fromSeedColorScheme.primary,
      elevation: 5,
      shadowColor: Colors.grey[800],
      titleTextStyle: theme.textTheme.titleLarge?.copyWith(
        color: Colors.black87,
        fontWeight: FontWeight.w600,
        fontFamily: POPPINS_FONT,
      ),
      toolbarTextStyle: theme.textTheme.titleLarge?.copyWith(
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontFamily: POPPINS_FONT,
      ),
    ),
    textTheme: theme.textTheme.copyWith(
      displayLarge: theme.textTheme.displayLarge?.copyWith(color: _textColor, fontWeight: FontWeight.normal, fontFamily: POPPINS_FONT),
      displayMedium: theme.textTheme.displayMedium?.copyWith(color: _textColor, fontWeight: FontWeight.normal, fontFamily: POPPINS_FONT),
      displaySmall: theme.textTheme.displaySmall?.copyWith(color: _textColor, fontWeight: FontWeight.normal, fontFamily: POPPINS_FONT),
      headlineMedium: theme.textTheme.headlineMedium?.copyWith(color: _textColor, fontWeight: FontWeight.normal, fontFamily: POPPINS_FONT),
      headlineSmall: theme.textTheme.headlineSmall?.copyWith(color: _textColor, fontWeight: FontWeight.normal, fontFamily: POPPINS_FONT),
      titleLarge: theme.textTheme.titleLarge?.copyWith(color: _textColor, fontWeight: FontWeight.w500, fontFamily: POPPINS_FONT),
      titleSmall: theme.textTheme.titleSmall?.copyWith(color: _textColor, fontWeight: FontWeight.w500, fontFamily: POPPINS_FONT),
      titleMedium: theme.textTheme.titleMedium?.copyWith(color: _textColor, fontWeight: FontWeight.w500, fontFamily: POPPINS_FONT),
      bodyLarge: theme.textTheme.bodyLarge?.copyWith(color: _textColor, fontWeight: FontWeight.normal, fontFamily: POPPINS_FONT),
      bodyMedium: theme.textTheme.bodyMedium?.copyWith(color: _textColor, fontWeight: FontWeight.normal, fontFamily: POPPINS_FONT),
      bodySmall: theme.textTheme.bodySmall?.copyWith(color: _textColor.withAlpha(120), fontFamily: POPPINS_FONT),
      labelLarge: theme.textTheme.labelLarge?.copyWith(color: _textColor, fontWeight: FontWeight.w500, fontFamily: POPPINS_FONT),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _fromSeedColorScheme.background.withAlpha(200),
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      hintStyle: theme.textTheme.bodySmall?.copyWith(
        color: Colors.white.withAlpha(120),
        fontWeight: FontWeight.w400,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.black),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return _fromSeedColorScheme.primaryContainer;
        }
        return null;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _fromSeedColorScheme.primaryContainer,
        surfaceTintColor: _fromSeedColorScheme.primaryContainer,
        side: BorderSide(color: _fromSeedColorScheme.primaryContainer, width: 2),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black87,
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFF49D1AB);
        }
        return null;
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFF2252B6);
        }
        return null;
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.white30.withOpacity(0.5);
        }
        return null;
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _fromSeedColorScheme.primary,
    ),
  );

  static ColorScheme get _fromSeedColorScheme => ColorScheme.fromSeed(
    seedColor: const Color(0xFF49D1AB), // Verde para a semente
    background: Colors.grey.shade400, // Cinza claro para o fundo
    brightness: Brightness.light,
    primary: const Color(0xFF49D1AB), // Verde para o primário
    surface: const Color(0xFFf5f5f5), // Cinza claro para a superfície
    surfaceVariant: Colors.grey.shade300, // Verde mais claro para superfície variante
    surfaceTint: const Color(0xFF49D1AB), // Verde claro para tintura
    primaryContainer: Colors.black, // Preto para o contêiner
  );
}
