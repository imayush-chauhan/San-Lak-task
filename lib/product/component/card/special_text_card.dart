import 'package:flutter/material.dart';

import '../../../core/extensions/app_extensions.dart';

class SpecialTextCard extends Card {
  SpecialTextCard(
      {Key? key, required BuildContext context, required String data})
      : super(
          key: key,
          elevation: 5,
          color: context.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
          child: Padding(
            padding: context.paddingNormal,
            child: Text(
              data,
              style: TextStyle(color: context.background),
            ),
          ),
        );
}

class SpecialTextCard2 extends Card {
  SpecialTextCard2(
      {Key? key, required BuildContext context, required String data})
      : super(
    key: key,
    elevation: 5,
    color: context.green,
    shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
    child: Padding(
      padding: context.paddingNormal,
      child: Text(
        data,
        style: TextStyle(color: context.background),
      ),
    ),
  );
}

snackBar(BuildContext context, String s){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 2000),
      backgroundColor: context.green,
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Text(s,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
