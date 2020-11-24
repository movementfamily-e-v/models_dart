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

  final String gitInfo;
  final String lastUpdate;
}
