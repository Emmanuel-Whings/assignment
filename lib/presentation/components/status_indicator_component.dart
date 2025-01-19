import 'package:assignment/presentation/components/center_component.dart';
import 'package:flutter/material.dart';

class StatusIndicatorComponent extends StatelessWidget {
  final String message;
  final IconData icon;

  const StatusIndicatorComponent(
      {super.key, required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CenterComponent(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 100,
            ),
          ),
          Text(message),
        ],
      ),
    );
  }
}
