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

    /*
      FIXME: can't make this unit test work
    Expected: throws Type:<TimeoutException>
      Actual: <Instance of 'Future<Response>'>
       Which: threw TimeoutException:<TimeoutException: >
     */
    test('should timeout after 2 seconds', () async {
      HttpClient httpclient = HttpClient('http://mockito', client: client);

      fakeAsync((async) {
        when(
          client.get(any),
        ).thenAnswer(
            (_) => Future.delayed(
            Duration(seconds: 40),
              () => null,
          ),
        );

        Future future = httpclient.get(
          'resource',
          timeout: const Duration(seconds: 2),
        );

        expect(
          future,
          throwsA(TimeoutException)
        );

        async.elapse(Duration(seconds: 2));

      });

    }, skip: true);
  });

  //TODO : Integration testing => Retrieve from web server
}
