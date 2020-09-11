import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;

  BigButton({@required this.onPressed, this.text, this.fontSize = 30});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          ),
        ),
      ),
    );
    /*
    return Theme(
      data: Theme.of(context).copyWith(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
          buttonColor: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Builder(builder: super.build),
    );
     */
  }
}
