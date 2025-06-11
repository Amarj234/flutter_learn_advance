/*
Configurable dimensions used throughout the app.
 */
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDimens {

  static const paddingSmall = 5.0;
  static const paddingNormal = 10.0;
  static const paddingMedium = 15.0;
  static const paddingLarge = 20.0;
  static const paddingXl = 40.0;
  static const paddingSafeVertical = 30.0;

  static const borderRadius = 8.0;

  static const cellRadius = 12.0;

  static const textFieldHeightWithError = 75.0;
  static const textFieldHeightWithoutError = 45.0;

  static const userImageSmall = 30.0;
  static const userImageMid = 37.0;
}

class EdgeInsetsDimens extends EdgeInsets{

  const EdgeInsetsDimens.horizontal(double value)
      : super.symmetric(horizontal: value);

  const EdgeInsetsDimens.vertical(double value)
      : super.symmetric(vertical: value);

  const EdgeInsetsDimens.login()
      : super.symmetric(horizontal: AppDimens.paddingLarge * 1.5);

  const EdgeInsetsDimens.screen()
      : super.all(AppDimens.paddingLarge);
  const EdgeInsetsDimens.screenHorizontal()
      : super.symmetric(horizontal: AppDimens.paddingLarge);
  const EdgeInsetsDimens.screenVertical()
      : super.symmetric(vertical: AppDimens.paddingLarge);
  const EdgeInsetsDimens.screenBottom()
      : super.only(bottom: AppDimens.paddingLarge);
  const EdgeInsetsDimens.screenTop()
      : super.only(top: AppDimens.paddingLarge);
  const EdgeInsetsDimens.screenLeft()
      : super.only(left: AppDimens.paddingLarge);
  const EdgeInsetsDimens.screenRight()
      : super.only(right: AppDimens.paddingLarge);

  const EdgeInsetsDimens.card()
      : super.all(AppDimens.paddingMedium);

  const EdgeInsetsDimens.surfaceLarge()
      : super.all(AppDimens.paddingLarge);
  const EdgeInsetsDimens.surfaceNormal()
      : super.all(AppDimens.paddingNormal);
  const EdgeInsetsDimens.surfaceSmall()
      : super.all(AppDimens.paddingSmall);
  static EdgeInsetsGeometry surfaceAttachmentDelete() =>
      EdgeInsetsDimens.surfaceNormal().add(EdgeInsets.only(right: -1 * AppDimens.paddingNormal));


  static EdgeInsetsGeometry comment() {
    return EdgeInsets.only(left:AppDimens.paddingMedium,right: AppDimens.paddingMedium,bottom: AppDimens.paddingMedium,top: 5).add(Platform.isIOS ? EdgeInsets.only(bottom: AppDimens.paddingMedium) : EdgeInsets.zero);
  }
}