import 'package:flutter_tractian_challenge/features/tree_assets/domain/entities/asset_entity.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/domain/repositories/asset_repository_interface.dart';

class GetAllAssetsByCompanyUseCase {
  final IAssetRepository _repository;

  GetAllAssetsByCompanyUseCase(this._repository);

  Future<List<AssetEntity>> call(String unityId) async {
    return await _repository.getAllAssetsByCompany(unityId);
  }
}
