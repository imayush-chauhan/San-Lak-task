import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;

  SlidePageRoute({required this.page, this.direction = AxisDirection.right})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var beginOffset = _getBeginOffset(direction);
      var endOffset = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: beginOffset, end: endOffset).chain(
        CurveTween(curve: curve),
      );

      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );

  static Offset _getBeginOffset(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0.0, 1.0);
      case AxisDirection.down:
        return const Offset(0.0, -1.0);
      case AxisDirection.left:
        return const Offset(1.0, 0.0);
      case AxisDirection.right:
      default:
        return const Offset(-1.0, 0.0);
    }
  }
}