import 'package:flutter/material.dart';

import '../../../core/extensions/app_extensions.dart';

class Headline6Text extends Text {
  Headline6Text({
    Key? key,
    required BuildContext context,
    required String data,
    Color? color,
  }) : super(
          data,
          key: key,
          style: const TextStyle(color: Colors.white)
          // style: context.textTheme.headlineSmall!.copyWith(
          //   color: color ?? context.secondaryVariant,
          //   fontWeight: FontWeight.bold
          // ),
        );
}
