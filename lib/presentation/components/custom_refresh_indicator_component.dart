import 'package:flutter/material.dart';

class CustomRefreshIndicatorComponent extends StatelessWidget {
  final Future<void> Function() callback;
  final Widget child;

  const CustomRefreshIndicatorComponent(
      {super.key, required this.callback, required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: callback,
      child: LayoutBuilder(
        builder: (context, dimensions) => SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            width: dimensions.maxWidth,
            height: dimensions.maxHeight,
            child: child,
          ),
        ),
      ),
    );
  }
}
