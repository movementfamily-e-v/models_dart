
class Feedback {
  String message;
  String email;

  Feedback({this.message = "", this.email = ""});

  Map<String, dynamic> toJson() => {
    'comment': this.message,
    'email': this.email,
  };
}
