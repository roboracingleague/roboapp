import 'package:mockito/mockito.dart';

import 'package:http/http.dart' as http;

void mockGet(http.Client client, String responseBody, int responseCode) {
  when(
    client.get(
      any,
      headers: anyNamed('headers'),
    ),
  ).thenAnswer(
    (_) => Future(
          () => http.Response(responseBody, responseCode),
        ),
  );
}