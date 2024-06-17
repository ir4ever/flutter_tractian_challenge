import 'dart:developer';

import 'package:flutter_tractian_challenge/features/tree_assets/domain/entities/asset_entity.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/domain/use_cases/get_all_assets_by_company_use_ase.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/domain/use_cases/get_all_locations_by_company_use_ase.dart.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/models/node_entity.dart';
import 'package:mobx/mobx.dart';

part 'asset_store.g.dart';

class AssetStore = _AssetStore with _$AssetStore;

abstract class _AssetStore with Store {
  final GetAllLocationsByCompanyUseCase _getAllLocationsByCompanyUseCase;
  final GetAllAssetsByCompanyUseCase _getAllAssetsByCompanyUseCase;

  _AssetStore(this._getAllLocationsByCompanyUseCase, this._getAllAssetsByCompanyUseCase);

  @observable
  List<AssetEntity> locations = [];
  @observable
  List<AssetEntity> assets = [];

  @computed
  List<NodeEntity> get itens =>
      [...locations, ...assets].map((asset) => NodeEntity(asset: asset, children: [])).toList();

  @computed
  List<NodeEntity> get nodes => _organizerNodes(itens);

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool newValue) {
    isLoading = newValue;
  }

  @action
  Future<void> getAllLocationsByCompany(String companyId) async {
    try {
      setLoading(true);
      locations = await _getAllLocationsByCompanyUseCase(companyId);
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<void> getAllAssetsByCompany(String companyId) async {
    try {
      setLoading(true);
      assets = await _getAllAssetsByCompanyUseCase(companyId);
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }

  List<NodeEntity> _organizerNodes(List<NodeEntity> nodes) {
    final assets = <NodeEntity>[];
    final List<int> indexesToRemove = [];
    for (var i = 0; i < nodes.length; i++) {
      var node = nodes[i];
      final externalId = node.asset.parentId.isNotEmpty ? node.asset.parentId : node.asset.locationId;
      if (externalId.isNotEmpty) {
        final index = nodes.indexWhere((assetId) => assetId.id == externalId);
        if (index == -1) {
          node = _addChild(externalId, node) ?? node;
        } else {
          nodes[index].children.add(node);
          indexesToRemove.add(i);
        }
      }
      assets.add(node);
    }

    for (var i = indexesToRemove.length - 1; i >= 0; i--) {
      final indexToRemove = indexesToRemove[i];
      assets.removeAt(indexToRemove);
    }
    return assets;
  }

  NodeEntity? _addChild(String parentId, NodeEntity nodeParent) {
    NodeEntity? nodeAux;
    for (var node in nodeParent.children) {
      if (node.id == parentId) {
        node.children.add(nodeParent);
        return node;
      }
      nodeAux = _addChild(parentId, node);
      if (nodeAux != null) return nodeAux;
    }
    return nodeAux;
  }
}
