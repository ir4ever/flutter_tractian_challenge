import 'package:flutter_tractian_challenge/features/tree_assets/domain/entities/asset_entity.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/domain/repositories/asset_repository_interface.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/infra/datasources/asset_datasource_interface.dart';

class AssetRepository implements IAssetRepository {
  final IAssetDatasource _datasource;
  AssetRepository(this._datasource);

  @override
  Future<List<AssetEntity>> getAllAssetsByCompany(String unityId) async {
    return await _datasource.getAllAssetsByCompany(unityId);
  }

  @override
  Future<List<AssetEntity>> getAllLocationsByCompany(String unityId) async {
    return await _datasource.getAllLocationsByCompany(unityId);
  }
}
