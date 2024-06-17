import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tractian_challenge/core/core_module.dart';
import 'package:flutter_tractian_challenge/features/home/domain/repositories/unity_repository_interface.dart';
import 'package:flutter_tractian_challenge/features/home/domain/use_cases/get_all_unities_use_case.dart';
import 'package:flutter_tractian_challenge/features/home/external/datasources/unity_datasource.dart';
import 'package:flutter_tractian_challenge/features/home/infra/datasources/unity_datasource_interface.dart';
import 'package:flutter_tractian_challenge/features/home/infra/repositories/unity_repository.dart';
import 'package:flutter_tractian_challenge/features/home/presenter/stores/home_store.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addLazySingleton(HomeStore.new);
    i.addLazySingleton(GetAllUnitiesUseCase.new);
    i.addLazySingleton<IUnityRepository>(UnityRepository.new);
    i.addLazySingleton<IUnitDatasource>(UnityDatasource.new);
  }
}
