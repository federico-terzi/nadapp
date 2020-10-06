import 'package:flutter/material.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/utils/date_utils.dart';

class BalanceCard extends StatelessWidget {
  final Balance balance;
  final VoidCallback onPressed;

  BalanceCard({this.balance, this.onPressed});

  Widget _renderRow(BuildContext context, String title, String value, {bool hide = false}) {
    if (hide) {
      return null;
    }

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
    return GestureDetector(
      onTap: onPressed,
      child: Card(
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
                  _renderRow(context, "Pressione", "${balance.maxPressure ?? ""}-${balance.minPressure ?? ""}", hide: balance.maxPressure == null && balance.minPressure == null),
                  _renderRow(context, "Frequenza", "${balance.heartFrequency ?? ""} bpm", hide: balance.heartFrequency == null),
                  _renderRow(context, "Peso", "${balance.weight ?? ""} kg", hide: balance.weight == null),
                  _renderRow(context, "Diuresi", "${balance.diuresis ?? ""} ML/24h", hide: balance.diuresis == null),
                  _renderRow(context, "Alvo: numero di evacuazioni", "${balance.fecesCount ?? "0"} N/24h", hide: balance.fecesCount == null),
                  _renderRow(context, "Consistenza evacuazioni", "${balance.fecesTexture ?? ""}", hide: balance.fecesTexture == null),
                  _renderRow(context, "Volume della STOMIA", "${balance.ostomyVolume ?? ""} ML/24h", hide: balance.ostomyVolume == null),
                  _renderRow(context, "Volume PEG", "${balance.pegVolume ?? ""} ML/24h", hide: balance.pegVolume == null),
                  _renderRow(context, "Altre perdite gastrointestinali", "${balance.otherGastrointestinalLosses ?? ""}", hide: balance.otherGastrointestinalLosses == null),
                  _renderRow(context, "Volume nutrizione parenterale", "${balance.parenteralNutritionVolume ?? ""} ML/24h", hide: balance.parenteralNutritionVolume == null),
                  _renderRow(context, "Volume altri liquidi endovena", balance.otherIntravenousLiquids ?? "", hide: balance.otherIntravenousLiquids == null),
                  _renderRow(context, "Liquidi per OS (bevande)", "${balance.osLiquids ?? ""} ML/24h", hide: balance.osLiquids == null),
                ].where((element) => element != null).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

}