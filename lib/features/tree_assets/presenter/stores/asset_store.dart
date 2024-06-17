import 'dart:developer';

import 'package:flutter_tractian_challenge/core/enuns/assets_enum.dart';
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

  _AssetStore(
    this._getAllLocationsByCompanyUseCase,
    this._getAllAssetsByCompanyUseCase,
  );

  @observable
  List<AssetEntity> locations = [];
  @observable
  List<AssetEntity> assets = [];
  @observable
  AssetStatusEnum? _statusToSearch;
  @observable
  String _nameToSearch = '';

  @observable
  bool isLoading = false;

  List<NodeEntity> get items => _organizeNodes(
        [...locations, ...assets].map((asset) => NodeEntity(asset: asset, children: [])).toList(),
      );

  @computed
  List<NodeEntity> get nodes {
    if (_statusToSearch != null && _nameToSearch.isNotEmpty) {
      return _getNodesByName(_getNodesByStatus(items));
    }
    if (_statusToSearch != null) {
      return _getNodesByStatus(items);
    }
    if (_nameToSearch.isNotEmpty) {
      return _getNodesByName(items);
    }
    return items;
  }

  @computed
  bool get isFiltered => _statusToSearch != null || _nameToSearch.isNotEmpty;

  @action
  void initializeValues() {
    _nameToSearch = '';
    _statusToSearch = null;
  }

  @action
  void setLoading(bool newValue) {
    isLoading = newValue;
  }

  @action
  void setStatusFilter(AssetStatusEnum newValue) {
    if (newValue == _statusToSearch) {
      _statusToSearch = null;
      return;
    }
    _statusToSearch = newValue;
  }

  @action
  void setNameToSearch(String newValue) {
    _nameToSearch = newValue;
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

  List<NodeEntity> _organizeNodes(List<NodeEntity> nodes) {
    final assets = <NodeEntity>[];
    final nodesToRemove = <NodeEntity>[];

    for (var node in nodes) {
      final externalId = node.asset.parentId.isNotEmpty ? node.asset.parentId : node.asset.locationId;
      if (externalId.isNotEmpty) {
        final parentIndex = nodes.indexWhere((n) => n.asset.id == externalId);
        if (parentIndex == -1) {
          node = _addChild(externalId, node) ?? node;
        } else {
          nodes[parentIndex].children.add(node);
          nodesToRemove.add(node);
        }
      }
      assets.add(node);
    }

    for (final node in nodesToRemove) {
      assets.remove(node);
    }

    return assets;
  }

  List<NodeEntity> _getNodesByStatus(List<NodeEntity> nodes) {
    final nodesByStatus = <NodeEntity>[];

    for (var node in nodes) {
      if (_searchStatusInNodes(node, _statusToSearch!)) {
        nodesByStatus.add(node);
      }
    }

    return nodesByStatus;
  }

  bool _searchStatusInNodes(NodeEntity nodeParent, AssetStatusEnum status) {
    final nodesToRemove = <NodeEntity>[];
    bool found = false;
    if (nodeParent.asset.status == status.nameStatus && nodeParent.asset.typeItem == TypeItemEnum.COMPONENT) {
      found = true;
    }
    for (final node in nodeParent.children) {
      if (_searchStatusInNodes(node, status)) {
        found = true;
      } else {
        nodesToRemove.add(node);
      }
    }
    for (final node in nodesToRemove) {
      nodeParent.children.remove(node);
    }
    return found;
  }

  List<NodeEntity> _getNodesByName(List<NodeEntity> nodes) {
    final nodesByName = <NodeEntity>[];

    for (var node in nodes) {
      if (_searchNameInNodes(node, _nameToSearch)) {
        nodesByName.add(node);
      }
    }

    return nodesByName;
  }

  bool _searchNameInNodes(NodeEntity nodeParent, String name) {
    final nodesToRemove = <NodeEntity>[];
    bool found = false;

    final nameToSearch = name.toLowerCase();
    final assetName = nodeParent.asset.name.toLowerCase();

    if (assetName.contains(nameToSearch)) {
      found = true;
    }
    for (final node in nodeParent.children) {
      if (_searchNameInNodes(node, name)) {
        found = true;
      } else {
        nodesToRemove.add(node);
      }
    }
    for (final node in nodesToRemove) {
      nodeParent.children.remove(node);
    }
    return found;
  }

  NodeEntity? _addChild(String parentId, NodeEntity nodeParent) {
    for (final node in nodeParent.children) {
      if (node.id == parentId) {
        node.children.add(nodeParent);
        return node;
      }
    }
    return null;
  }
}
