import 'package:coin_control/app/shared/themes/fonts.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static Color get _textColor => Colors.grey.shade300;

  static themeData(ThemeData theme) => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        dividerTheme: DividerThemeData(
          space: 10,
          color: Colors.grey.shade600,
          thickness: 1,
        ),
        fontFamily: POPPINS_FONT,
        appBarTheme: AppBarTheme(
          iconTheme: theme.iconTheme.copyWith(color: _fromSeedColorScheme.primary),
          elevation: 0,
          titleTextStyle: theme.textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: POPPINS_FONT,
          ),
          toolbarTextStyle: theme.textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: POPPINS_FONT,
          ),
        ),
        textTheme: theme.textTheme.copyWith(
          displayLarge: theme.textTheme.displayLarge?.copyWith(
            color: _textColor,
            fontWeight: FontWeight.normal,
            fontFamily: POPPINS_FONT,
          ),
          displayMedium: theme.textTheme.displayMedium?.copyWith(
            color: _textColor,
            fontWeight: FontWeight.normal,
            fontFamily: POPPINS_FONT,
          ),
          displaySmall: theme.textTheme.displaySmall?.copyWith(
            color: _textColor,
            fontWeight: FontWeight.normal,
            fontFamily: POPPINS_FONT,
          ),
          headlineMedium: theme.textTheme.headlineMedium?.copyWith(
            color: _textColor,
            fontWeight: FontWeight.normal,
            fontFamily: POPPINS_FONT,
          ),
          headlineSmall: theme.textTheme.headlineSmall?.copyWith(
            color: _textColor,
            fontWeight: FontWeight.normal,
            fontFamily: POPPINS_FONT,
          ),
          titleLarge: theme.textTheme.titleLarge?.copyWith(
            color: _textColor,
            fontWeight: FontWeight.w500,
            fontFamily: POPPINS_FONT,
          ),
          titleSmall: theme.textTheme.titleSmall?.copyWith(
            color: _textColor,
            fontWeight: FontWeight.w500,
            fontFamily: POPPINS_FONT,
          ),
          titleMedium: theme.textTheme.titleMedium?.copyWith(
            color: _textColor,
            fontWeight: FontWeight.w500,
            fontFamily: POPPINS_FONT,
          ),
          bodyLarge: theme.textTheme.bodyLarge?.copyWith(
            color: _textColor,
            fontWeight: FontWeight.normal,
            fontFamily: POPPINS_FONT,
          ),
          bodyMedium: theme.textTheme.bodyMedium?.copyWith(
            color: _textColor,
            fontWeight: FontWeight.normal,
            fontFamily: POPPINS_FONT,
          ),
          bodySmall: theme.textTheme.bodySmall?.copyWith(
            color: _textColor.withAlpha(120),
            fontFamily: POPPINS_FONT,
          ),
          labelLarge: theme.textTheme.labelLarge?.copyWith(
            color: _textColor,
            fontWeight: FontWeight.w500,
            fontFamily: POPPINS_FONT,
          ),
        ),
        dialogTheme: theme.dialogTheme.copyWith(
          titleTextStyle: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: POPPINS_FONT,
            fontSize: 15,
          ),
          contentTextStyle: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            fontFamily: POPPINS_FONT,
            color: Colors.white,
          ),
          surfaceTintColor: _fromSeedColorScheme.background,
        ),
        expansionTileTheme: const ExpansionTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.white,
        ),
        cardTheme: CardTheme(
          color: _fromSeedColorScheme.surfaceVariant,
          surfaceTintColor: _fromSeedColorScheme.onBackground,
        ),
        drawerTheme: DrawerThemeData(
          surfaceTintColor: _fromSeedColorScheme.background,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        ),
        colorScheme: _fromSeedColorScheme,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: _fromSeedColorScheme.primaryContainer,
            surfaceTintColor: _fromSeedColorScheme.primaryContainer,
            side: BorderSide(color: _fromSeedColorScheme.primaryContainer, width: 2),
          ),
        ),
        listTileTheme: ListTileThemeData(
          leadingAndTrailingTextStyle: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            fontFamily: POPPINS_FONT,
            color: Colors.white,
          ),
        ),
        timePickerTheme: const TimePickerThemeData(
          hourMinuteTextStyle: TextStyle(
            fontFamily: POPPINS_FONT,
            fontSize: 48,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          showDragHandle: true,
        ),
        chipTheme: ChipThemeData(
          labelStyle: theme.textTheme.labelLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: POPPINS_FONT,
          ),
          brightness: Brightness.dark,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: _fromSeedColorScheme.surfaceTint,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          hintStyle: theme.textTheme.bodySmall?.copyWith(
            color: _textColor.withAlpha(120),
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _fromSeedColorScheme.primaryContainer,
            foregroundColor: Colors.black,
            minimumSize: const Size(48, 64),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: POPPINS_FONT,
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
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
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: _fromSeedColorScheme.primaryContainer,
          ),
        ),
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const Color(0xFF007348);
            }
            return Colors.grey.shade300;
          }),
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.grey.shade400;
            }
            return Colors.grey.shade400;
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
        seedColor: const Color(0xFF007348),
        background: Colors.black54,
        brightness: Brightness.dark,
        primary: const Color(0xFF007348),
        secondary: const Color(0xFF2252B6),
        onBackground: Colors.white.withAlpha(120),
        onPrimary: Colors.white,
        surfaceVariant: Colors.black12,
        surfaceTint: Colors.black12,
        primaryContainer: const Color(0xFF007348),
      );
}
