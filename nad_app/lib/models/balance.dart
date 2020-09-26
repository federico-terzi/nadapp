import 'package:flutter/widgets.dart';

@immutable
class Balance {
  final String uuid;
  final DateTime date;
  final int minPressure;
  final int maxPressure;
  final int heartFrequency;
  final double weight;
  final int diuresis;
  final int fecesCount;
  final String fecesTexture;
  final int ostomyVolume;
  final int pegVolume;
  final String otherGastrointestinalLosses;
  final int parenteralNutritionVolume;
  final String otherIntravenousLiquids;
  final int osLiquids;
  final int intravenousLiquidsVolume;

  Balance(
      {this.uuid,
        this.date,
      this.minPressure,
      this.maxPressure,
      this.heartFrequency,
      this.weight,
      this.diuresis,
      this.fecesCount,
      this.fecesTexture,
      this.ostomyVolume,
      this.pegVolume,
      this.otherGastrointestinalLosses,
      this.parenteralNutritionVolume,
      this.otherIntravenousLiquids,
      this.osLiquids,
      this.intravenousLiquidsVolume});

  Balance copyWith(
      {uuid,
        date,
      minPressure,
      maxPressure,
      heartFrequency,
      weight,
      diuresis,
      fecesCount,
      fecesTexture,
      ostomyVolume,
      pegVolume,
      otherGastrointestinalLosses,
      parenteralNutritionVolume,
      otherIntravenousLiquids,
      osLiquids,
      intravenousLiquidsVolume}) {
    return Balance(
      uuid: uuid ?? this.uuid,
        date: date ?? this.date,
        minPressure: minPressure ?? this.minPressure,
        maxPressure: maxPressure ?? this.maxPressure,
        heartFrequency: heartFrequency ?? this.heartFrequency,
        weight: weight ?? this.weight,
        diuresis: diuresis ?? this.diuresis,
        fecesCount: fecesCount ?? this.fecesCount,
        fecesTexture: fecesTexture ?? this.fecesTexture,
        ostomyVolume: ostomyVolume ?? this.ostomyVolume,
        pegVolume: pegVolume ?? this.pegVolume,
        otherGastrointestinalLosses:
            otherGastrointestinalLosses ?? this.otherGastrointestinalLosses,
        parenteralNutritionVolume:
            parenteralNutritionVolume ?? this.parenteralNutritionVolume,
        otherIntravenousLiquids:
            otherIntravenousLiquids ?? this.otherIntravenousLiquids,
        osLiquids: osLiquids ?? this.osLiquids,
        intravenousLiquidsVolume:
            intravenousLiquidsVolume ?? this.intravenousLiquidsVolume);
  }

  Balance.fromMap(Map<String, dynamic> json)
      : uuid = json['uuid'],
        date = DateTime.fromMillisecondsSinceEpoch(json['date']),
        minPressure = json['minPressure'],
        maxPressure = json['maxPressure'],
        heartFrequency = json['heartFrequency'],
        weight = json['weight'],
        diuresis = json['diuresis'],
        fecesCount = json['fecesCount'],
        fecesTexture = json['fecesTexture'],
        ostomyVolume = json['ostomyVolume'],
        pegVolume = json['pegVolume'],
        otherGastrointestinalLosses = json['otherGastrointestinalLosses'],
        parenteralNutritionVolume = json['parenteralNutritionVolume'],
        otherIntravenousLiquids = json['otherIntravenousLiquids'],
        osLiquids = json['parenteralNutritionVolume'],
        intravenousLiquidsVolume = json['intravenousLiquidsVolume'];

  Map<String, dynamic> toMap() =>
      {
        'uuid': uuid,
        'date': date.millisecondsSinceEpoch,
        'minPressure': minPressure,
        'maxPressure': maxPressure,
        'heartFrequency': heartFrequency,
        'weight': weight,
        'diuresis': diuresis,
        'fecesCount': fecesCount,
        'fecesTexture': fecesTexture,
        'ostomyVolume': ostomyVolume,
        'pegVolume': pegVolume,
        'otherGastrointestinalLosses': otherGastrointestinalLosses,
        'parenteralNutritionVolume': parenteralNutritionVolume,
        'otherIntravenousLiquids': otherIntravenousLiquids,
        'osLiquids': osLiquids,
        'intravenousLiquidsVolume': intravenousLiquidsVolume,
      };

  Map<String, dynamic> toJson() => this.toMap();

  @override
  String toString() {
    return 'Balance{uuid: $uuid, date: $date, minPressure: $minPressure, maxPressure: $maxPressure, heartFrequency: $heartFrequency, weight: $weight, diuresis: $diuresis, fecesCount: $fecesCount, fecesTexture: $fecesTexture, ostomyVolume: $ostomyVolume, pegVolume: $pegVolume, otherGastrointestinalLosses: $otherGastrointestinalLosses, parenteralNutritionVolume: $parenteralNutritionVolume, otherIntravenousLiquids: $otherIntravenousLiquids, osLiquids: $osLiquids, intravenousLiquidsVolume: $intravenousLiquidsVolume}';
  }
}
