import 'package:flutter/material.dart';

class ClampingBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}

class ClampingScrollConfiguration extends StatelessWidget {
  const ClampingScrollConfiguration({
    super.key,
    required this.child,
    this.behavior,
  });

  final Widget child;
  final ScrollBehavior? behavior;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: behavior ?? ClampingBehavior(),
      child: child,
    );
  }
}
