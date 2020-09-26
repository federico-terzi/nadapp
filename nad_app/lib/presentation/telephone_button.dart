import 'package:flutter/material.dart';
import 'package:nad_app/theme/style.dart';

class TelephoneButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String number;
  final String helpText;

  TelephoneButton({@required this.onPressed, this.number, this.helpText});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: MAIN_COLOR,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                number,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 8),
              Text(
                  helpText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
