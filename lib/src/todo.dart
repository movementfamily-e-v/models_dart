import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'data.dart';

part 'todo.g.dart';

@HiveType(typeId: 8)
class Todo extends Data {
  Todo(
      {this.id,
      this.finished,
      this.userId,
      this.dateEnd,
      this.todoTask,
      this.todoDescr})
      : super(id, todoTask, todoDescr, '');

  factory Todo.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String ?? '';
    final descr = json['short_description'] as String ?? '';
    final userid = json['user_id'] as int;
    final finished = json['is_finished'] as bool;
    final endDate = DateTime.parse(json['end_date']);
    final int id = json['id'];
    return Todo(
        userId: userid,
        dateEnd: endDate,
        todoTask: name,
        todoDescr: descr,
        finished: finished,
        id: id);
  }
  @HiveField(0)
  @override
  final int id;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final String todoTask;
  @HiveField(3)
  final String todoDescr;
  @HiveField(4)
  final DateTime dateEnd;
  @HiveField(5)
  bool finished;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'body_context': '-1',
        'name': todoTask,
        'end_date': DateFormat('yyyy-MM-dd').format(dateEnd),
        'short_description': todoDescr,
        'user_id': userId,
        'is_finished': finished
      };

  @override
  String toString() =>
      'Todo Super: ${super.toString()} Todo finished? $finished Todo Task: $todoTask Todo Desc $todoDescr Date End: $dateEnd UserId: $userId TodoId: $id';
}
