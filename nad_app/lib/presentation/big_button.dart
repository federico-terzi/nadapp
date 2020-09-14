import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final Key key;
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  final bool primary;
  final bool loading;

  BigButton(
      {@required this.onPressed,
      this.text,
      this.fontSize = 30,
      this.primary = true,
      this.loading = false,
      this.key});

  Widget _getContent(BuildContext context) {
    if (!this.loading) {
      return Text(
        text,
        textAlign: TextAlign.center,
        style: primary
            ? TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold)
            : TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.button.color),
      );
    } else {
      return Align(
          child: CircularProgressIndicator(
              value: null,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: loading ? null : onPressed,
      color: primary
          ? Theme.of(context).accentColor
          : Theme.of(context).buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          child: _getContent(context),
        ),
      ),
    );
  }
}
