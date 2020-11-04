import 'package:flutter/foundation.dart';

class ServerInformation {
  final String gitInfo;
  final String lastUpdate;
  const ServerInformation({this.gitInfo, this.lastUpdate});

  factory ServerInformation.fromJson(dynamic result) {
    String update;
    String git;
    try {
      debugPrint("SERVER INFORMATION RESULT $result");
      git = result.toString().split("Gitversion:")[1];
      debugPrint("SERVER INFORMATION RESULT GITString: $git");

      String compilestr = result.toString().split("Gitversion:")[0];
      debugPrint(
          "SERVER INFORMATION RESULT GITString: $git Compile string: $compilestr Compile date string ");

      String compiledate = compilestr.split("Compiletime:")[1];
      debugPrint(
          "SERVER INFORMATION RESULT GITString: $git Compile string: $compilestr Compile date string $compiledate ");

      update = compiledate.split(".")[0];
      debugPrint(
          "SERVER INFORMATION RESULT GITString: $git Compile string: $compilestr Compile date string $compiledate last update $update");
    } catch (e) {
      debugPrint("SERVER INFORMATION ERROR PARSING $e");
    }
    return ServerInformation(gitInfo: git, lastUpdate: update);
  }
}