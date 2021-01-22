import 'package:hive/hive.dart';

part 'server_information.g.dart';

@HiveType(typeId: 7)
class ServerInformation {
  const ServerInformation({this.gitInfo, this.lastUpdate});

  factory ServerInformation.fromJson(dynamic result) {
    String update;
    String git;
    try {
      git = result.toString().split('Gitversion:')[1];

      final compilestr = result.toString().split('Gitversion:')[0];

      final compiledate = compilestr.split('Compiletime:')[1];

      update = compiledate.split('.')[0];
    } catch (e) {
      print('ERROR HAPPENED AT PARSING SERVERINFORMATION \n $e');
    }
    return ServerInformation(gitInfo: git ?? '', lastUpdate: update ?? '');
  }
  @HiveField(0)
  final String gitInfo;
  @HiveField(1)
  final String lastUpdate;
}
