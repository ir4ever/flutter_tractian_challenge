import 'package:flutter_tractian_challenge/features/tree_assets/domain/entities/asset_entity.dart';

abstract class IAssetDatasource {
  Future<List<AssetEntity>> getAllAssetsByCompany(String unityId);
  Future<List<AssetEntity>> getAllLocationsByCompany(String unityId);
}
