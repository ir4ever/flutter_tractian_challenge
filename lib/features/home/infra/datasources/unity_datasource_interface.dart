import 'package:flutter_tractian_challenge/features/home/domain/entities/unity_entity.dart';

abstract class IUnitDatasource {
  Future<List<UnityEntity>> getAllUnities();
}
