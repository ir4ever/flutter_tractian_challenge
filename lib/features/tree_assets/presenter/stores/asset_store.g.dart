// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AssetStore on _AssetStore, Store {
  Computed<List<AssetEntity>>? _$itensComputed;

  @override
  List<AssetEntity> get itens =>
      (_$itensComputed ??= Computed<List<AssetEntity>>(() => super.itens,
              name: '_AssetStore.itens'))
          .value;
  Computed<List<NodeEntity>>? _$nodesComputed;

  @override
  List<NodeEntity> get nodes =>
      (_$nodesComputed ??= Computed<List<NodeEntity>>(() => super.nodes,
              name: '_AssetStore.nodes'))
          .value;

  late final _$locationsAtom =
      Atom(name: '_AssetStore.locations', context: context);

  @override
  List<AssetEntity> get locations {
    _$locationsAtom.reportRead();
    return super.locations;
  }

  @override
  set locations(List<AssetEntity> value) {
    _$locationsAtom.reportWrite(value, super.locations, () {
      super.locations = value;
    });
  }

  late final _$assetsAtom = Atom(name: '_AssetStore.assets', context: context);

  @override
  List<AssetEntity> get assets {
    _$assetsAtom.reportRead();
    return super.assets;
  }

  @override
  set assets(List<AssetEntity> value) {
    _$assetsAtom.reportWrite(value, super.assets, () {
      super.assets = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AssetStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getAllLocationsByCompanyAsyncAction =
      AsyncAction('_AssetStore.getAllLocationsByCompany', context: context);

  @override
  Future<void> getAllLocationsByCompany(String companyId) {
    return _$getAllLocationsByCompanyAsyncAction
        .run(() => super.getAllLocationsByCompany(companyId));
  }

  late final _$getAllAssetsByCompanyAsyncAction =
      AsyncAction('_AssetStore.getAllAssetsByCompany', context: context);

  @override
  Future<void> getAllAssetsByCompany(String companyId) {
    return _$getAllAssetsByCompanyAsyncAction
        .run(() => super.getAllAssetsByCompany(companyId));
  }

  late final _$_AssetStoreActionController =
      ActionController(name: '_AssetStore', context: context);

  @override
  void setLoading(bool newValue) {
    final _$actionInfo = _$_AssetStoreActionController.startAction(
        name: '_AssetStore.setLoading');
    try {
      return super.setLoading(newValue);
    } finally {
      _$_AssetStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locations: ${locations},
assets: ${assets},
isLoading: ${isLoading},
itens: ${itens},
nodes: ${nodes}
    ''';
  }
}
