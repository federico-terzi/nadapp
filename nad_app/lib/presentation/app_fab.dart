import 'package:flutter/material.dart';
import 'package:nad_app/theme/style.dart';

class AppFab extends StatelessWidget {
  final String tooltip;
  final VoidCallback onPressed;

  AppFab({this.tooltip, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: FloatingActionButton(
        tooltip: tooltip,
        onPressed: onPressed,
        child: const Icon(Icons.add, size: 40),
      ),
    );
  }

}