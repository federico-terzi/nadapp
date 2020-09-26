import 'package:flutter/material.dart';
import 'package:nad_app/theme/style.dart';

class BigIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final bool inverted;
  final double fontSize;

  BigIconButton({@required this.onPressed, this.text, this.icon, this.inverted = false, this.fontSize = 30});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: !inverted ? MAIN_COLOR : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: !inverted ? Colors.white : MAIN_COLOR),
              SizedBox(width: 15),
              Expanded(
                child: Text(text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: fontSize,
                        color: !inverted ? Colors.white : MAIN_COLOR,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
