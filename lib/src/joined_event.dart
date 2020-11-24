import 'joined.dart';

class JoinedEvent extends Joined {
  JoinedEvent(this.eventId, this.id, this.userId) : super(id);

  factory JoinedEvent.fromJson(Map<String, dynamic> json) {
    final eventId = json['eventId'] as int;
    final id = json['id'] as int;
    final user = json['userId'] as int;
    return JoinedEvent(eventId, id, user);
  }

  final int eventId;
  @override
  final int id;
  final int userId;
  DateTime date;

  @override
  String toString() =>
      'id: $id User Id: $userId Event Id: $eventId  Date: $date';

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is JoinedEvent) {
      return other.id == id &&
          other.eventId == eventId &&
          other.userId == userId;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => id.hashCode + eventId.hashCode + userId.hashCode;
}
