import 'package:flutter_tractian_challenge/core/enuns/type_item_enum.dart';

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

  TypeItemEnum get typeItem {
    if (status.isNotEmpty && parentId.isNotEmpty) {
      return TypeItemEnum.SUBASSET;
    }
    if (parentId.isNotEmpty) {
      return TypeItemEnum.SUBLOCATION;
    }
    if (sensorType.isNotEmpty) {
      return TypeItemEnum.COMPONENT;
    }
    if (status.isNotEmpty) {
      return TypeItemEnum.ASSET;
    }
    return TypeItemEnum.LOCATION;
  }
}
