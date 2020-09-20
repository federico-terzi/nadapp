import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nad_app/theme/style.dart';

class DateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final DateTime date;
  final bool includeTime;

  DateButton({@required this.onPressed, this.date, this.includeTime = true});

  String renderDateTime(DateTime date) {
    // TODO: if date is closer than 5 minutes, show "Adesso"
    var jiffy = Jiffy(date)..startOf(Units.MINUTE);
    return "${jiffy.fromNow()} (${jiffy.format("HH:mm")})";
  }

  String renderDate(DateTime date) {
    // TODO: if date is today, output "Oggi"

    var jiffy = Jiffy(date)..startOf(Units.DAY);
    return "${jiffy.fromNow()} (${jiffy.format("dd/MM/yyyy")})";
  }

  @override
  Widget build(BuildContext context) {
    var label = includeTime ? renderDateTime(date) : renderDate(date);
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
              Text(label,
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
