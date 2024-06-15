import 'package:flutter_tractian_challenge/core/http/client_http.dart';
import 'package:flutter_tractian_challenge/features/home/domain/entities/unity_entity.dart';
import 'package:flutter_tractian_challenge/features/home/external/models/unity_model.dart';
import 'package:flutter_tractian_challenge/features/home/infra/datasources/unity_datasource_interface.dart';

class UnityDatasouce implements IUnitDatasource {
  final IHttpClient _client;

  UnityDatasouce(this._client);

  @override
  Future<List<UnityEntity>> getAllUnities() async {
    final response = await _client.get('companies');
    if (response.statusCode != 200) return [];
    return (response.data as List).map((unity) => UnityModel.fromMap(unity)).toList();
  }
}
