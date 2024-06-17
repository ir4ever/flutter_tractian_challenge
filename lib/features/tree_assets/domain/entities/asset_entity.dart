import 'package:flutter_tractian_challenge/core/enuns/assets_enum.dart';

class AssetEntity {
  final String gatewayId;
  final String id;
  final String locationId;
  final String name;
  final String parentId;
  final String sensorId;
  final String sensorType;
  final String status;

  AssetEntity({
    required this.gatewayId,
    required this.id,
    required this.locationId,
    required this.name,
    required this.parentId,
    required this.sensorId,
    required this.sensorType,
    required this.status,
  });

  bool get isRoot => parentId.isEmpty && locationId.isEmpty;

  TypeItemEnum get typeItem {
    if (parentId.isEmpty && locationId.isEmpty && gatewayId.isEmpty) {
      return TypeItemEnum.LOCATION;
    }
    if (parentId.isNotEmpty && locationId.isEmpty && gatewayId.isEmpty) {
      return TypeItemEnum.SUBLOCATION;
    }
    if (sensorType.isNotEmpty) {
      return TypeItemEnum.COMPONENT;
    }
    if (parentId.isEmpty) {
      return TypeItemEnum.ASSET;
    }
    return TypeItemEnum.SUBASSET;
  }

  AssetStatusEnum? get assetStatus {
    if (status.isEmpty) return null;
    if (status == 'operating') {
      return AssetStatusEnum.ON;
    }
    return AssetStatusEnum.OFF;
  }
}
