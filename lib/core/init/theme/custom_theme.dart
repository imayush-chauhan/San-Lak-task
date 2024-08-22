import 'package:flutter/material.dart';

import '../../extensions/app_extensions.dart';

class CustomTextTheme extends TextTheme {
  final BuildContext context;

  const CustomTextTheme(this.context);

  @override
  TextStyle get headline1 =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(color: context.label);
  @override
  TextStyle get headline2 =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(color: context.label);
  @override
  TextStyle get headline3 =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(color: context.label);
  @override
  TextStyle get headline4 =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(color: context.label);
  @override
  TextStyle get headline5 =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(color: context.label);
  @override
  TextStyle get headline6 =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(color: context.label);
  @override
  TextStyle get subtitle1 =>
      Theme.of(context).textTheme.headlineSmall!.copyWith(color: context.label);
  @override
  TextStyle get subtitle2 =>
      Theme.of(context).textTheme.headlineSmall!.copyWith(color: context.label);
  @override
  TextStyle get bodyText1 =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(color: context.label);
  @override
  TextStyle get bodyText2 =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(color: context.label);
  @override
  TextStyle get caption =>
      Theme.of(context).textTheme.labelMedium!.copyWith(color: context.label);
  @override
  TextStyle get button =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(color: context.label);
  @override
  TextStyle get overline =>
      Theme.of(context).textTheme.displayMedium!.copyWith(color: context.label);
}
