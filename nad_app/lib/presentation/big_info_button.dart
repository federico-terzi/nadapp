import 'package:flutter/material.dart';
import 'package:nad_app/theme/style.dart';

class BigInfoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  BigInfoButton({@required this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.help_outline, size: 70, color: DARKER_GRAY_COLOR),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Text(text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 22,
                          color: DARKEST_GRAY_COLOR,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 30, color: DARKER_GRAY_COLOR),
            ],
          ),
        ),
      ),
    );
  }
}
