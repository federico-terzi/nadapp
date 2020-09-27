import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onPressed;

  HomeCard({this.image, this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onPressed,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Image.asset(image, height: 90),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Text(label, textAlign: TextAlign.center, style: Theme.of(context).textTheme.button),
                ),
              ],
            ),
          ),
        ));
  }
}
