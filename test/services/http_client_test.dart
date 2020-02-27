import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:robo_app/services/http_client.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('Mockito', () {
    MockClient client;

    setUp(() async {
      client = MockClient();
    });

    test('should retrieve hello body and 200 statuscode from httpclient', () async {
      HttpClient httpclient = HttpClient('http://mockito', client: client);

      when(
        client.get(any),
      ).thenAnswer(
        (_) => Future(
          () => http.Response('Hello From HttpClient !', 200),
        ),
      );

      final actual = await httpclient.get('resource');
      expect(actual.body, 'Hello From HttpClient !');
      expect(actual.statusCode, 200);
    });

    test('should retrieve not found body and 404 statuscode from httpclient', () async {
      HttpClient httpclient = HttpClient('http://mockito', client: client);

      when(
        client.get(any),
      ).thenAnswer(
        (_) => Future(
          () => http.Response('Not Found', 404),
        ),
      );

      final actual = await httpclient.get('resource');
      expect(actual.body, 'Not Found');
      expect(actual.statusCode, 404);
    });

    test('should timeout after 5 seconds', () async {
      HttpClient httpclient = HttpClient('http://mockito', client: client);

      final timeout = Duration(seconds: 5);

      fakeAsync((async) {
        when(
          client.get(any),
        ).thenAnswer(
            (_) => Future.delayed(timeout * 2, () => null),
        );

        Future future = httpclient.get('resource', timeout: timeout);

        expect(future, throwsA(isA<TimeoutException>()));

        async.elapse(timeout);
      });
    });
  });

  //TODO : Integration testing => Retrieve from web server
}
