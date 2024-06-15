import 'package:flutter_tractian_challenge/features/home/domain/entities/unity_entity.dart';

class UnityModel extends UnityEntity {
  UnityModel({required super.id, required super.name});

  Map<String, dynamic> toMap() {
    return {id: id, name: name};
  }

  factory UnityModel.fromMap(Map<String, dynamic> map) {
    return UnityModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
