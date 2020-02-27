import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

/// An access point to the API
class HttpClient {
  /// Path of the API including schema, port, hostname and route base
  final String basePath;
  final http.Client _client;
  final log = Logger('HttpClient');

  /// Creates the instance to connect to [basePath]
  HttpClient(this.basePath, {http.Client client})
      : _client = client ?? http.Client();

  /// Creates a request url by concatenating the [basePath] and the [path],
  /// makes a http GET request and returns the http response
  ///
  /// If the request takes longer than [timeout] then throws a TimeoutException.
  Future<http.Response> get(String path,
      {Duration timeout = const Duration(seconds: 10)}) async {
    final fullPath = '$basePath/$path';
    log.info('going for http GET on: $fullPath');

    return await _client.get(fullPath).timeout(timeout);
  }
}
