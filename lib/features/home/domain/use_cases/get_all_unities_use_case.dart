import 'package:flutter_tractian_challenge/features/home/domain/entities/unity_entity.dart';
import 'package:flutter_tractian_challenge/features/home/domain/repositories/unity_repository_interface.dart';

class GetAllUnitiesUseCase {
  final IUnityRepository _repository;

  GetAllUnitiesUseCase(this._repository);

  Future<List<UnityEntity>> call() async {
    return await _repository.getAllUnities();
  }
}
