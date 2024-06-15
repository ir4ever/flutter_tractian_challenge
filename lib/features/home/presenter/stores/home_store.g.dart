// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$unitiesAtom = Atom(name: '_HomeStore.unities', context: context);

  @override
  List<UnityEntity> get unities {
    _$unitiesAtom.reportRead();
    return super.unities;
  }

  @override
  set unities(List<UnityEntity> value) {
    _$unitiesAtom.reportWrite(value, super.unities, () {
      super.unities = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeStore.isLoading', context: context);

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

  late final _$getAllUnitsAsyncAction =
      AsyncAction('_HomeStore.getAllUnits', context: context);

  @override
  Future<void> getAllUnits() {
    return _$getAllUnitsAsyncAction.run(() => super.getAllUnits());
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setLoading(bool newValue) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setLoading');
    try {
      return super.setLoading(newValue);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
unities: ${unities},
isLoading: ${isLoading}
    ''';
  }
}
