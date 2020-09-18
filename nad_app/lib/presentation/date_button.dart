import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nad_app/theme/style.dart';

class DateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final DateTime date;

  DateButton({@required this.onPressed, this.date});

  String renderDate(DateTime date) {
    var jiffy = Jiffy(date)..startOf(Units.MINUTE);
    return "${jiffy.fromNow()} (${jiffy.format("HH:mm")})";
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text(renderDate(date),
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: DARKEST_GRAY_COLOR,
                  )),
              SizedBox(
                height: 5,
              ),
              Text("Clicca qui per cambiare la data",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: DARKEST_GRAY_COLOR)),
            ],
          ),
        ),
      ),
    );
  }
}
