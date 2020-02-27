import 'package:http/http.dart' as http;

import 'package:robo_app/services/http_client.dart';

class RulesDownloader extends HttpClient {
  RulesDownloader(String basePath, {http.Client client})
    : super(basePath, client: client);

  Future<String> getDronesRules() async {
    final r = await get('robodrones.md');
    switch (r.statusCode) {
      case 200:
        return r.body;
      default:
        throw UnsupportedError('unknown status code : ${r.statusCode}');
    }
  }

  Future<String> getCarsRules() async {
    final r = await get('robocars.md');
    switch (r.statusCode) {
      case 200:
        return r.body;
      default:
        throw UnsupportedError('unknown status code : ${r.statusCode}');
    }
  }
}
