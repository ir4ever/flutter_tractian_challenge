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

  Map<String, NodeEntity> get nodesMap => {
        for (var asset in [...locations, ...assets]) asset.id: NodeEntity(asset: asset, children: [])
      };

  List<NodeEntity> get organizedNodes => _organizeNodes(nodesMap);

  @computed
  List<NodeEntity> get nodes {
    List<NodeEntity> filteredNodes = organizedNodes;
    if (_statusToSearch != null) {
      filteredNodes = _getNodesByStatus(filteredNodes);
    }
    if (_nameToSearch.isNotEmpty) {
      filteredNodes = _getNodesByName(filteredNodes);
    }
    return filteredNodes;
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
    _statusToSearch = _statusToSearch == newValue ? null : newValue;
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

  List<NodeEntity> _organizeNodes(Map<String, NodeEntity> nodeMap) {
    final Set<String> idsToRemove = {}; //para remover depois os itens que ja foram adicionados como filhos

    for (var node in nodeMap.values) {
      final externalId =
          node.asset.parentId.isNotEmpty ? node.asset.parentId : node.asset.locationId; //defini se node tem um pai
      if (externalId.isNotEmpty && nodeMap.containsKey(externalId)) {
        nodeMap[externalId]!.children.add(node);
        idsToRemove.add(node.asset.id);
      }
    }

    return nodeMap.values.where((node) => !idsToRemove.contains(node.asset.id)).toList(); //remove os itens repetidos
  }

  List<NodeEntity> _getNodesByStatus(List<NodeEntity> nodes) {
    return nodes.where((node) => _filterNodesByStatus(node, _statusToSearch!)).toList();
  }

  bool _filterNodesByStatus(NodeEntity node, AssetStatusEnum status) {
    final nodesToRemove = <NodeEntity>[];
    bool found = false;
    if (node.asset.status == status.nameStatus && node.asset.typeItem == TypeItemEnum.COMPONENT) {
      found = true;
    }
    for (final node in node.children) {
      if (_filterNodesByStatus(node, status)) {
        found = true; //permito toda a execucão para limpar os campos que nao tem o status desejado
      } else {
        nodesToRemove.add(node);
      }
    }

    node.children.removeWhere(nodesToRemove.contains);
    return found;
  }

  List<NodeEntity> _getNodesByName(List<NodeEntity> nodes) {
    return nodes.where((node) => _filterNodesByName(node, _nameToSearch)).toList();
  }

  bool _filterNodesByName(NodeEntity node, String name) {
    final nodesToRemove = <NodeEntity>[];
    bool found = node.asset.name.toLowerCase().contains(name.toLowerCase());

    for (final child in node.children) {
      if (_filterNodesByName(child, name)) {
        found = true; //permito toda a execucão para limpar os campos que nao contem o nome buscado
      } else {
        nodesToRemove.add(child);
      }
    }

    node.children.removeWhere(nodesToRemove.contains);
    return found;
  }
}
