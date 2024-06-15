import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tractian_challenge/core/core_module.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/domain/repositories/asset_repository_interface.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/domain/use_cases/get_all_assets_by_company_use_ase.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/domain/use_cases/get_all_locations_by_company_use_ase.dart.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/external/datasources/asset_datasource.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/infra/datasources/asset_datasource_interface.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/infra/repositories/asset_repository.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/stores/asset_store.dart';

class AssetModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];
  @override
  void binds(i) {
    i.addLazySingleton(AssetStore.new);
    i.addLazySingleton(GetAllAssetsByCompanyUseCase.new);
    i.addLazySingleton(GetAllLocationsByCompanyUseCase.new);
    i.addLazySingleton<IAssetRepository>(AssetRepository.new);
    i.addLazySingleton<IAssetDatasource>(AssetDatasource.new);
  }
}
