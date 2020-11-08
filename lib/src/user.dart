import 'package:intl/intl.dart';

import 'data.dart';

enum UserRole { Guest, Registered, Trainer, Admin }

class User extends Data {
  User(
      {this.id,
      this.birthdate,
      this.email,
      this.fullName,
      this.name,
      this.loggedIn,
      this.newsLetter,
      this.userRole = UserRole.Guest,
      this.authKey = '',
      this.passwort = ''})
      : super(id, fullName, email, name);

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as int;
    final birthdate = json['birthdate'] == null
        ? DateTime.now()
        : DateTime.parse(json['birthdate'].toString());
    final email = json['email'] as String ?? '';
    final fullName = json['full_name'] as String ?? '';
    final name = json['name'] as String ?? '';
    final loggedIn = json['logged_in'] as bool ?? false;
    final newsLetter = json['news_letter'] as bool ?? false;
    final roleyKey = json['user_role_key_id'] as int ?? 2;
    final UserRole key = roleyKey == 1
        ? UserRole.Admin
        : roleyKey == 2
            ? UserRole.Trainer
            : roleyKey == 3
                ? UserRole.Registered
                : UserRole.Guest;
    final authKey = json['authKey']?.toString() ?? '';
    // String pw = json['password'] ?? "";
    return User(
        id: id,
        birthdate: birthdate,
        email: email,
        fullName: fullName,
        name: name,
        loggedIn: loggedIn,
        newsLetter: newsLetter,
        userRole: key,
        authKey: authKey);
  }

  factory User.fromCreate(
          {DateTime birthdate,
          String email,
          String first,
          String last,
          String passwort,
          String login,
          String role}) =>
      User(
          birthdate: birthdate,
          fullName: '$first $last',
          email: email,
          name: login,
          userRole: User.roleFromString(role),
          passwort: passwort,
          loggedIn: false,
          newsLetter: false);

  factory User.fromCreateTrainer({int userId}) => User(id: userId);

  static UserRole roleFromString(String value) {
    final newValue = value.toLowerCase();
    if (newValue.contains('admin'))
      return UserRole.Admin;
    else if (newValue.contains('trainer'))
      return UserRole.Trainer;
    else if (newValue.contains('member'))
      return UserRole.Registered;
    else
      return UserRole.Guest;
  }

  UserRole userRole;
  String authKey;

  final String name;
  final int id;
  final DateTime birthdate;
  final String email;
  final String fullName;
  final bool loggedIn;
  final bool newsLetter;
  final String passwort;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'birthdate': DateFormat('yyyy-MM-dd').format(birthdate),
        'email': email,
        'full_name': fullName,
        'logged_in': loggedIn,
        'news_letter': newsLetter,
        'name': name,
        'user_role_key_id': userRole == UserRole.Admin
            ? 1
            : userRole == UserRole.Trainer
                ? 2
                : userRole == UserRole.Registered
                    ? 3
                    : 4,
        'authKey': authKey
      };

  Map<String, dynamic> toCreateJson() => <String, dynamic>{
        'birthdate': DateFormat('yyyy-MM-dd').format(birthdate),
        'email': email,
        'full_name': fullName,
        'name': name,
        'password': passwort,
        'user_role_key_id': userRole == UserRole.Admin
            ? 1
            : userRole == UserRole.Trainer
                ? 2
                : userRole == UserRole.Registered
                    ? 3
                    : 4,
        'logged_in': loggedIn,
        'news_letter': newsLetter
      };

  bool get isAuthenticated =>
      userRole == UserRole.Registered ||
      userRole == UserRole.Trainer ||
      userRole == UserRole.Admin;

  bool get isAdmin => userRole == UserRole.Admin;

  bool get isTrainer => userRole == UserRole.Trainer;

  @override
  String toString() =>
      'Id: $id authKey: $authKey Birthdate: $birthdate Email $email FullName: $fullName Loggedin: $loggedIn Newsletter: $newsLetter User Role Key: $userRole';
}
