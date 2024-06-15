import 'package:flutter_tractian_challenge/features/tree_assets/domain/entities/asset_entity.dart';

class AssetModel extends AssetEntity {
  AssetModel(
      {required super.gatewayId,
      required super.id,
      required super.locationId,
      required super.name,
      required super.parentId,
      required super.sensorId,
      required super.sensorType,
      required super.status});

  factory AssetModel.fromMap(Map<String, dynamic> map) => AssetModel(
        gatewayId: map["gatewayId"] ?? '',
        id: map["id"] ?? '',
        locationId: map["locationId"] ?? '',
        name: map["name"] ?? '',
        parentId: map["parentId"] ?? '',
        sensorId: map["sensorId"] ?? '',
        sensorType: map["sensorType"] ?? '',
        status: map["status"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "gatewayId": gatewayId,
        "id": id,
        "locationId": locationId,
        "name": name,
        "parentId": parentId,
        "sensorId": sensorId,
        "sensorType": sensorType,
        "status": status,
      };
}
