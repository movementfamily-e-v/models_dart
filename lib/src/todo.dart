import 'package:intl/intl.dart';

import 'data.dart';

class Todo extends Data {
  final int id;
  final int userId;
  final String todoTask;
  final String todoDescr;
  final DateTime dateEnd;
  bool finished;
  Todo(
      {this.id,
      this.finished,
      this.userId,
      this.dateEnd,
      this.todoTask,
      this.todoDescr})
      : super(id, todoTask, todoDescr, "");

  factory Todo.fromJson(Map<String, dynamic> json) {
    final String name = json['name'] as String ?? "";
    final String descr = json['short_description'] as String ?? "";
    final int userid = json['user_id'] as int;
    final bool finished = json['is_finished'] as bool;
    final DateTime endDate = DateTime.parse(json['end_date']);
    final int id = json['id'];
    return Todo(
        userId: userid,
        dateEnd: endDate,
        todoTask: name,
        todoDescr: descr,
        finished: finished,
        id: id);
  }

  Map<String, dynamic> toJson() => {
        'body_context': "-1",
        'name': todoTask,
        'end_date': DateFormat('yyyy-MM-dd').format(dateEnd),
        'short_description': todoDescr,
        'user_id': userId,
        'is_finished': finished
      };

  @override
  String toString() =>
      "Todo Super: ${super.toString()} Todo finished? $finished Todo Task: $todoTask Todo Desc $todoDescr Date End: $dateEnd UserId: $userId TodoId: $id";
}
