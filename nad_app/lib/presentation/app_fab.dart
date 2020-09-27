import 'package:flutter/material.dart';
import 'package:nad_app/theme/style.dart';

class AppFab extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  AppFab({this.text, this.onPressed, this.icon = Icons.add});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: MAIN_COLOR,
      onPressed: onPressed,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 10, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(width: 8),
            Text(text,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }

}