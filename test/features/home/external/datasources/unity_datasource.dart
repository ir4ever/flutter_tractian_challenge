import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tractian_challenge/core/http/client_http.dart';
import 'package:flutter_tractian_challenge/features/home/external/datasources/unity_datasource.dart';
import 'package:flutter_tractian_challenge/features/home/external/models/unity_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/unity_mock.dart';

class HttpClientMock extends Mock implements IHttpClient {}

void main() {
  late UnityDatasource datasource;
  late IHttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = UnityDatasource(client);
  });

  final tUnityModel = UnityModel(id: '662fd0ee639069143a8fc387', name: 'Jaguar');
  const path = '/companies';

  void successMock() {
    when(() => client.get(any())).thenAnswer((_) async => const HttpReponse(data: unityMock, statusCode: 200));
  }

  test('should call the get method with correct url', () async {
    successMock();
    await datasource.getAllUnities();
    verify(() => client.get(path)).called(1);
  });

  test('should return a List of UnityModel when the call is successful', () async {
    successMock();
    final result = await datasource.getAllUnities();
    expect(result, [tUnityModel]);
    verify(() => client.get(any())).called(1);
  });
}
