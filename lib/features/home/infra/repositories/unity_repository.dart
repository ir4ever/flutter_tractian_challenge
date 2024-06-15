import 'package:flutter_tractian_challenge/features/home/domain/entities/unity_entity.dart';
import 'package:flutter_tractian_challenge/features/home/domain/repositories/unity_repository_interface.dart';
import 'package:flutter_tractian_challenge/features/home/infra/datasources/unity_datasource_interface.dart';

class UnityRepository implements IUnityRepository {
  final IUnitDatasource _datasource;

  UnityRepository(this._datasource);

  @override
  Future<List<UnityEntity>> getAllUnities() async {
    return await _datasource.getAllUnities();
  }
}
