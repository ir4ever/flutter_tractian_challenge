import 'package:flutter_tractian_challenge/core/http/client_http.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/domain/entities/asset_entity.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/external/models/asset_model.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/infra/datasources/asset_datasource_interface.dart';

class AssetDatasource implements IAssetDatasource {
  final IHttpClient _client;
  AssetDatasource(this._client);

  @override
  Future<List<AssetEntity>> getAllAssetsByCompany(String unityId) async {
    final response = await _client.get('/companies/$unityId/assets');
    if (response.statusCode != 200) return [];
    return (response.data as List).map((unity) => AssetModel.fromMap(unity)).toList();
  }

  @override
  Future<List<AssetEntity>> getAllLocationsByCompany(String unityId) async {
    final response = await _client.get('/companies/$unityId/locations');
    if (response.statusCode != 200) return [];
    return (response.data as List).map((unity) => AssetModel.fromMap(unity)).toList();
  }
}
