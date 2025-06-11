import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_dimens.dart';

class MyThemes {
  static ThemeData getThemeData(
      BuildContext context, {
        Color seedColor = AppColorsThem.primaryColor,
        int themval=1,// here pass 0 or 1 for light and dark theme
      }) {
    var fontFamily = GoogleFonts.openSans().fontFamily;
    var textTheme = TextTheme(
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: AppColorsThem.primaryTextColor(themval),
        letterSpacing: 0,
      ),
      displayMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: AppColorsThem.primaryTextColor(themval),
        letterSpacing: 0,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: AppColorsThem.secondaryTextColor(themval),
        letterSpacing: 0,
      ),
      headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: AppColorsThem.primaryTextColor(themval),
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: AppColorsThem.primaryTextColor(themval),
        letterSpacing: 0,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: AppColorsThem.secondaryTextColor(themval),
        letterSpacing: 0,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: AppColorsThem.primaryTextColor(themval),
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: AppColorsThem.primaryTextColor(themval),
        letterSpacing: 0,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: AppColorsThem.secondaryTextColor(themval),
        letterSpacing: 0,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: AppColorsThem.primaryTextColor(themval),
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: AppColorsThem.primaryTextColor(themval),
        letterSpacing: 0,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        color: AppColorsThem.secondaryTextColor(themval),
        letterSpacing: 0,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: AppColorsThem.primaryTextColor(themval),
        letterSpacing: 0,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: AppColorsThem.primaryTextColor(themval),
        letterSpacing: 0,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: AppColorsThem.secondaryTextColor(themval),
        letterSpacing: 0,
      ),
    );



    var colorScheme = ColorScheme.fromSeed(
      brightness: themval==1 ?Brightness.light:Brightness.dark,
      seedColor: seedColor,
      surface: AppColorsThem.surfaceColor(themval),
      background: AppColorsThem.backgroundColor(themval),
      primary: seedColor,
      outline: AppColorsThem.borderColor(themval),
      error: AppColorsThem.errorColor(themval),
    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));

    return ThemeData(
      textTheme: textTheme,
      scaffoldBackgroundColor: AppColorsThem.backgroundColor(themval) ,
      useMaterial3: false,
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      shadowColor: AppColorsThem.shadowColor(themval),
      elevatedButtonTheme:  ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColorsThem.onPrimaryTextColor,
          backgroundColor: seedColor,
          disabledBackgroundColor: AppColorsThem.disabledButtonColor(themval),
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          ),
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.all(AppDimens.paddingNormal),
        ),
      ),
      outlinedButtonTheme:  OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: seedColor),
          foregroundColor: seedColor,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          ),
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.all(AppDimens.paddingNormal),
        ),
      ),
      textButtonTheme:  TextButtonThemeData(
        style: TextButton.styleFrom(
            textStyle: textTheme.labelLarge,
            padding: const EdgeInsetsDimens.vertical(AppDimens.paddingNormal).add(EdgeInsetsDimens.screenHorizontal()),
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadius),
            )
        ),
      ),
      snackBarTheme: SnackBarThemeData (
          backgroundColor: AppColorsThem.snackBarColor(themval),
          behavior: SnackBarBehavior.floating,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          insetPadding: EdgeInsets.only(bottom: 20, left: 10, right: 10)
      ),
      bottomSheetTheme: BottomSheetThemeData(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimens.cellRadius)),
          ),
          clipBehavior: Clip.hardEdge,
          backgroundColor: colorScheme.surface
      ),
      appBarTheme: AppBarTheme(

        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: textTheme.titleLarge?.apply(color: AppColorsThem.primaryTextColor(themval)),
        elevation: 0,
      ),
      cardTheme: CardTheme(
          shape:  RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(AppDimens.cellRadius)),
          ),
          color:  colorScheme.surface,
          margin: EdgeInsets.all(0),
          elevation: 1,
          shadowColor: AppColorsThem.shadowColor(themval)
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: seedColor,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      searchBarTheme: SearchBarThemeData(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          side: BorderSide(color: AppColorsThem.borderColor(themval)),
        )),
        backgroundColor: WidgetStateProperty.all(AppColorsThem.surfaceColor(themval)),
        hintStyle: WidgetStateProperty.all(textTheme.bodyLarge?.copyWith(color: AppColorsThem.secondaryTextColor(themval))),
        textStyle: WidgetStateProperty.all(textTheme.bodyLarge),
        elevation: WidgetStateProperty.all(0),
        padding: const WidgetStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: AppDimens.paddingNormal, vertical: 0)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppDimens.paddingNormal),
        hintStyle: textTheme.bodyLarge?.copyWith(color: AppColorsThem.secondaryTextColor(themval)),
        errorStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.outline, width: 1)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.outline, width: 1)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary, width: 1)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.error, width: 1)
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColorsThem.disabledButtonColor(themval), width: 1)
        ),
      ),
    );
  }

  static InputDecoration getDecoration({String? hint, String? error}) {
    return InputDecoration(
      errorText: error,
      hintText: hint,
      counterText: '',
    );
  }

  // static BoxShadow getTopShadow(BuildContext context) {
  //   return  BoxShadow(
  //     color: AppColors.topShadowColor(context),
  //     spreadRadius: 0,
  //     blurRadius: 20,
  //     offset: Offset(0, -1),
  //   );
  // }
}
