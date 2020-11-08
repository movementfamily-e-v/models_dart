class Feedback {
  Feedback({this.message = '', this.email = ''});

  String message;
  String email;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'comment': message,
        'email': email,
      };
}
