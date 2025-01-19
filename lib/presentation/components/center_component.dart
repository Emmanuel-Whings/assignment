import "package:flutter/material.dart";

class CenterComponent extends StatelessWidget {
  final List<Widget> children;
  const CenterComponent({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
