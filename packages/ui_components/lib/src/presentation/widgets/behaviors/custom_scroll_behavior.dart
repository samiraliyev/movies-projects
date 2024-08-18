import 'package:flutter/material.dart';



class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class CustomScrollConfiguration extends StatelessWidget {
  const CustomScrollConfiguration({
    super.key,
    required this.child,
    this.behavior,
  });

  final Widget child;
  final ScrollBehavior? behavior;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: behavior ?? CustomScrollBehavior(),
      child: child,
    );
  }
}
