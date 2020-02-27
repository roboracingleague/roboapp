import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:robo_app/services/rules_downloader.dart';

import 'http_mock_helper.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('Mockito', () {
    RulesDownloader downloader;
    MockClient client;

    setUp(() async {
      client = MockClient();
      downloader = RulesDownloader('http://mockito', client: client);
    });

    test('mockito should create a "hello from" response', () async {
      mockGet(
        client,
        'Hello From getDronesRules !',
        200);

      final actual = await downloader.getDronesRules();
      expect(actual, 'Hello From getDronesRules !');
    });

    test('mockito should create a "hello from" response', () async {
      mockGet(
        client,
        'Hello From getCarsRules !',
        200);

      final actual = await downloader.getCarsRules();
      expect(actual, 'Hello From getCarsRules !');
    });

    //TODO : Test Timeout ?

    test('mockito should throw UnsupportedError when other than 200 on getCarsRules', () async {
      mockGet(client, '', 404);

      expect(() async => await downloader.getCarsRules(), throwsUnsupportedError);
    });

    test('mockito should throw UnsupportedError when other than 200 on getDronesRules', () async {
      mockGet(client, '', 404);

      expect(() async => await downloader.getDronesRules(), throwsUnsupportedError);
    });

  });

  //TODO : Integration testing => Retrieve from web server
}
