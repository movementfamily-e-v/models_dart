import 'package:intl/intl.dart';

import 'data.dart';
import 'trainer.dart';

extension IdList on List<Trainer> {
  List<int> get toIdList {
    final List<int> ids = [];
    for (Trainer t in this) {
      ids.add(t.id);
    }
    return ids;
  }
}

class Training extends Data {
  const Training(
      {this.ageFrom,
      this.ageTill,
      this.validSince,
      this.validTill,
      this.isAG,
      this.name,
      this.shortDescription,
      this.timeFrom,
      this.timeTill,
      this.bodyContext,
      this.weekDay,
      this.id,
      this.trainers,
      this.primaryTrainerId,
      this.image,
      this.locationId,
      this.trainings})
      : super(id, shortDescription, bodyContext ?? "", name);

  factory Training.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final int id = json['data']['id'] as int;
      final int ageFrom = json['data']['age_from'] as int;
      final int ageTill = json['data']['age_till'] as int;
      final DateTime validSince = json['data']['valid_since'] == null
          ? DateTime.now()
          : DateTime.parse(json['data']['valid_since']);
      final DateTime validTill = json['data']['valid_till'] == null
          ? validSince.add(const Duration(days: 365))
          : DateTime.parse(json['data']['valid_till']);

      final timeFrom =
          DateTime.parse("0000-00-00 ${json['data']['time_from']}");
      final timeTill =
          DateTime.parse("0000-00-00 ${json['data']['time_till']}");

      final bool ag = json['data']['is_ag'] as bool;
      final String bodyContext = json['data']['body_context'] ?? "";
      final String name = json['data']['name'] ?? "";
      final String shortdescr = json['data']['short_description'] ?? "";
      final String weekday = (json['data']['weekday'] as String);
      final WeekDay wday = weekday.weekDay;
      final trainersJson = (json['data']['trainers'] as List);

      final int locationId = json['data']['location']['id'] as int ?? -1;
      final int primTrainerId = json['data']['primary_trainer'] == null
          ? -1
          : (json['data']['primary_trainer']['id'] as int ?? -1);

      final List<Trainer> trainers = [];

      if (trainersJson != null && trainersJson.isNotEmpty) {
        for (final Map<String, dynamic> trainer in trainersJson) {
          trainers.add(Trainer.fromJson(trainer));
        }
      }

      final List<TrainingDate> trainings = [];
      final trainingsJson = (json['data']['trainings'] as List);
      if (trainingsJson != null && trainingsJson.isNotEmpty) {
        for (final Map<String, dynamic> training in trainingsJson) {
          trainings.add(TrainingDate.fromJson(training, timeFrom));
        }
      }
      final String image = json['data']['image'] as String ?? "";
      return Training(
          ageFrom: ageFrom,
          ageTill: ageTill,
          validSince: validSince,
          validTill: validTill,
          isAG: ag,
          name: name,
          shortDescription: shortdescr,
          timeFrom: timeFrom,
          timeTill: timeTill,
          bodyContext: bodyContext,
          weekDay: wday,
          id: id,
          trainers: trainers,
          primaryTrainerId: primTrainerId,
          image: image,
          locationId: locationId,
          trainings: trainings);
    } else {
      final int id = json['id'] as int;
      final int ageFrom = json['age_from'] as int;
      final int ageTill = json['age_till'] as int;
      final DateTime validSince = json['valid_since'] == null
          ? DateTime.now()
          : DateTime.parse(json['valid_since']);
      final DateTime validTill = json['valid_till'] == null
          ? validSince.add(const Duration(days: 365))
          : DateTime.parse(json['valid_till']);

      final DateTime timeFrom =
          DateTime.parse("0000-00-00 ${json['time_from']}");
      final DateTime timeTill =
          DateTime.parse("0000-00-00 ${json['time_till']}");

      final bool ag = json['is_ag'] as bool;
      final String bodyContext = json['body_context'] ?? "";
      final String name = json['name'] ?? "";
      final String shortdescr = json['short_description'] ?? "";
      final String weekday = (json['weekday'] as String);
      final WeekDay wday = weekday.weekDay;
      final trainersJson = (json['trainers'] as List);

      final int locationId = json['location']['id'] as int ?? -1;
      final int primTrainerId = json['primary_trainer'] == null
          ? -1
          : (json['primary_trainer']['id'] as int ?? -1);

      final List<Trainer> trainers = [];

      if (trainersJson != null && trainersJson.isNotEmpty) {
        for (final Map<String, dynamic> trainer in trainersJson) {
          trainers.add(Trainer.fromJson(trainer));
        }
      }

      final List<TrainingDate> trainings = [];
      final trainingsJson = (json['trainings'] as List);
      if (trainingsJson != null && trainingsJson.isNotEmpty) {
        for (final Map<String, dynamic> training in trainingsJson) {
          trainings.add(TrainingDate.fromJson(training, timeFrom));
        }
      }
      final String image = json['image'] as String ?? "";

      return Training(
          ageFrom: ageFrom,
          ageTill: ageTill,
          validSince: validSince,
          validTill: validTill,
          isAG: ag,
          name: name,
          shortDescription: shortdescr,
          timeFrom: timeFrom,
          timeTill: timeTill,
          bodyContext: bodyContext,
          weekDay: wday,
          id: id,
          trainers: trainers,
          primaryTrainerId: primTrainerId,
          image: image,
          locationId: locationId,
          trainings: trainings);
    }
  }

  final int id;

  final int ageFrom;

  final int ageTill;

  final DateTime validTill;

  final DateTime validSince;

  final DateTime timeFrom;

  final DateTime timeTill;

  final bool isAG;

  final String name;

  final String shortDescription;

  final String bodyContext;

  final WeekDay weekDay;

  final List<Trainer> trainers;

  final List<TrainingDate> trainings;

  final int primaryTrainerId;
  final String image;

  final int locationId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'training_base': {
          'age_from': ageFrom,
          'age_till': ageTill,
          'is_ag': isAG,
          'name': name,
          'short_description': shortDescription,
          'time_from': DateFormat('HH:mm').format(timeFrom),
          'time_till': DateFormat('HH:mm').format(timeTill),
          'valid_till': DateFormat('yyyy-MM-dd').format(validTill),
          'valid_since': DateFormat('yyyy-MM-dd').format(validSince),
          'weekday': weekDay.toString().split('.')[1].toUpperCase(),
          'trainers': trainers.toIdList..add(primTrainerId),
          'location_id': locationId,
          'primary_trainer_id': primTrainerId
        }
      };

  bool isTrainingCanceled(DateTime date) {
    for (final train in trainings) {
      if (train.date == date) {
        return train.isCanceled;
      }
    }

    return false;
  }

  int get primTrainerId {
    if (primaryTrainerId != -1) return primaryTrainerId;
    if (trainers.isNotEmpty) {
      return trainers.first.id;
    } else {
      return -1;
    }
  }

  int compareTo(Training b) => timeFrom.compareTo(b.timeFrom);
}

enum WeekDay { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

extension WeekDayUtils on WeekDay {
  //TODO fulfill functionality to enum
/*  String get englishVersion {
    switch (this) {

      case WeekDay.Monday:
        // TODO: Handle this case.
        break;
      case WeekDay.Tuesday:
        // TODO: Handle this case.
        break;
      case WeekDay.Wednesday:
        // TODO: Handle this case.
        break;
      case WeekDay.Thursday:
        // TODO: Handle this case.
        break;
      case WeekDay.Friday:
        // TODO: Handle this case.
        break;
      case WeekDay.Saturday:
        // TODO: Handle this case.
        break;
      case WeekDay.Sunday:
        // TODO: Handle this case.
        break;
    }
  }

  String get germanVersion {
    switch (this) {

      case WeekDay.Monday:
        // TODO: Handle this case.
        break;
      case WeekDay.Tuesday:
        // TODO: Handle this case.
        break;
      case WeekDay.Wednesday:
        // TODO: Handle this case.
        break;
      case WeekDay.Thursday:
        // TODO: Handle this case.
        break;
      case WeekDay.Friday:
        // TODO: Handle this case.
        break;
      case WeekDay.Saturday:
        // TODO: Handle this case.
        break;
      case WeekDay.Sunday:
        // TODO: Handle this case.
        break;
    }
  }
  */
}

extension WeekDayUtility on String {
  WeekDay get weekDay {
    final current = this.toLowerCase();
    if (current == "montag" || current == "monday") return WeekDay.Monday;
    if (current == "dienstag" || current == "tuesday") return WeekDay.Tuesday;
    if (current == "mittwoch" || current == "wednesday")
      return WeekDay.Wednesday;
    if (current == "donnerstag" || current == "thursday")
      return WeekDay.Thursday;
    if (current == "freitag" || current == "friday") return WeekDay.Friday;
    if (current == "samstag" || current == "saturday") return WeekDay.Saturday;
    if (current == "sonntag" || current == "sunday") return WeekDay.Sunday;
    return null;
  }
}

class TrainingDate {
  const TrainingDate(this.date, this.isCanceled, this.users);

  factory TrainingDate.fromJson(Map<String, dynamic> json, DateTime timeFrom) {
    final format = DateFormat("HH:mm:ss");
    final DateTime date =
        DateTime.parse("${json['date'] ?? ""} ${format.format(timeFrom)}") ??
            DateTime.now();
    final bool canceled = json['is_canceld'] ?? false;
    final List<int> users = json['users'].cast<int>() ?? [];
    return TrainingDate(date, canceled, users);
  }

  final DateTime date;
  final bool isCanceled;
  final List<int> users;
}
