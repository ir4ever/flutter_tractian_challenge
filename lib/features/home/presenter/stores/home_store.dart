import 'dart:developer';

import 'package:flutter_tractian_challenge/features/home/domain/entities/unity_entity.dart';
import 'package:flutter_tractian_challenge/features/home/domain/use_cases/get_all_unities_use_case.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final GetAllUnitiesUseCase _getAllUnitsUseCase;

  _HomeStore(this._getAllUnitsUseCase);

  @observable
  List<UnityEntity> unities = [];

  @observable
  bool isLoading = false;

  @action
  void setLoading(bool newValue) {
    isLoading = newValue;
  }

  @action
  Future<void> getAllUnits() async {
    try {
      setLoading(true);
      unities = await _getAllUnitsUseCase();
    } catch (e) {
      log(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
