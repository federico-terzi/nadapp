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

  final int dirty;

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
      this.dirty = 0});

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
      dirty}) {
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
        dirty: dirty ?? this.dirty,
    );
  }

  Balance.fromMap(Map<String, dynamic> map)
      : uuid = map['uuid'],
        date = DateTime.parse(map['date']),
        minPressure = map['minPressure'],
        maxPressure = map['maxPressure'],
        heartFrequency = map['heartFrequency'],
        weight = map['weight']?.toDouble(),
        diuresis = map['diuresis'],
        fecesCount = map['fecesCount'],
        fecesTexture = map['fecesTexture'],
        ostomyVolume = map['ostomyVolume'],
        pegVolume = map['pegVolume'],
        otherGastrointestinalLosses = map['otherGastrointestinalLosses'],
        parenteralNutritionVolume = map['parenteralNutritionVolume'],
        otherIntravenousLiquids = map['otherIntravenousLiquids'],
        osLiquids = map['parenteralNutritionVolume'],
        dirty = map['dirty'] ?? 0;

  Map<String, dynamic> toJson()
  {
    var map = {
      'uuid': uuid,
      'date': date.toIso8601String(),
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
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }


  Map<String, dynamic> toMap() =>
      {
        'uuid': uuid,
        'date': date.toIso8601String(),
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
        'dirty': dirty,
      };

  @override
  String toString() {
    return 'Balance{uuid: $uuid, date: $date, minPressure: $minPressure, maxPressure: $maxPressure, heartFrequency: $heartFrequency, weight: $weight, diuresis: $diuresis, fecesCount: $fecesCount, fecesTexture: $fecesTexture, ostomyVolume: $ostomyVolume, pegVolume: $pegVolume, otherGastrointestinalLosses: $otherGastrointestinalLosses, parenteralNutritionVolume: $parenteralNutritionVolume, otherIntravenousLiquids: $otherIntravenousLiquids, osLiquids: $osLiquids, dirty: $dirty}';
  }
}
