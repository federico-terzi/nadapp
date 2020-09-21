import 'package:flutter/material.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/utils/date_utils.dart';

class BalanceCard extends StatelessWidget {
  final Balance balance;

  BalanceCard({this.balance});

  Widget _renderRow(BuildContext context, String title, String value) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        Text("$title:", style: Theme.of(context).textTheme.headline4),
        SizedBox(width: 5),
        Text(value, style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: ListTile(
          title: Text(getFullFormattedDate(balance.date), style: Theme.of(context).textTheme.headline4),
          subtitle:
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderRow(context, "Pressione", "${balance.maxPressure}-${balance.minPressure}"),
                _renderRow(context, "Frequenza", "${balance.heartFrequency} bpm"),
                _renderRow(context, "Peso", "${balance.weight} kg"),
                _renderRow(context, "Diuresi", "${balance.diuresis} ML/24h"),
                _renderRow(context, "Alvo: numero di evacuazioni", "${balance.fecesCount} N/24h"),
                _renderRow(context, "Consistenza evacuazioni", "${balance.fecesTexture ?? ""}"),
                _renderRow(context, "Volume della STOMIA", "${balance.ostomyVolume} ML/24h"),
                _renderRow(context, "Volume PEG", "${balance.pegVolume} ML/24h"),
                _renderRow(context, "Altre perdite gastrointestinali", "${balance.otherGastrointestinalLosses ?? ""}"),
                _renderRow(context, "Volume nutrizione parenterale", "${balance.parenteralNutritionVolume} ML/24h"),
                _renderRow(context, "Volume altri liquidi endovena", balance.otherIntravenousLiquids ?? ""),
                _renderRow(context, "Liquidi per OS (bevande)", "${balance.parenteralNutritionVolume} ML/24h"),
                _renderRow(context, "Volume liquidi endovena", "${balance.intravenousLiquidsVolume} ML/24h"),
              ],
            ),
          ),
        ),
      ),
    );
  }

}