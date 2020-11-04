import 'package:flutter/cupertino.dart';

import 'joined.dart';

class JoinedTrain extends Joined {
  final int trainingId;
  // final List<DateTime> dates;
  final bool canceled;
  final DateTime date;
  final bool ag;
  JoinedTrain(this.trainingId, this.canceled, this.date, this.ag) : super(-1);

  static List<JoinedTrain> fromJson(dynamic json) {
    final List<JoinedTrain> trains = [];

    print("ALLJOINEDTRAINDATA $json");
    for (Map<String, dynamic> train in json) {
      final int trainingId = train['id'] as int;
      final bool ag = train['is_ag'];
      final timeFrom = train['time_from'];
      final List<dynamic> rawDates =
          (train['trainings'] as List) ?? (train['dates'] as List);

      for (Map<String, dynamic> trainObj in rawDates) {
        final date = DateTime.parse("${trainObj['date'] as String} $timeFrom");
        final canceled = trainObj['is_canceld'];
        trains.add(JoinedTrain(trainingId, canceled, date, ag));
      }
      //final List<DateTime> dates = rawDates.length > 0 ? rawDates.map((e) => DateTime.parse(e['date'] as String)).toList() : [];

      //  dates.forEach((element) {
      //   });
    }

    return trains;
    // debugPrint("DATETIMEPARSE AFTER: $date before: ${json['date']}");
    // return JoinedTrain(id, trainingId, dates: dates, userId: userId);
  }

  bool joinedTrain(int trainId, DateTime date) {
    bool isIn = false;
    debugPrint("CHECK FOR JOINED TRAIN ${_sameTrainingsDays(this.date, date)}");
    if (trainId == trainingId && _sameTrainingsDays(this.date, date))
      isIn = true;
    return isIn;
  }

  bool _sameTrainingsDays(DateTime first, DateTime other) =>
      (first.year == other.year &&
          first.month == other.month &&
          first.day == other.day &&
          first.hour == other.hour &&
          first.minute == other.minute);

  @override
  String toString() => "id: $id Training Id: $trainingId Date: $date";

  @override
  bool operator ==(other) {
    if (identical(this, other))
      return true;
    else if (other is JoinedTrain)
      return other.id == id && other.trainingId == trainingId;
    else
      return false;
  }

  @override
  int get hashCode =>
      id.hashCode +
      trainingId.hashCode +
      date.hashCode +
      ag.hashCode +
      canceled.hashCode;
}
