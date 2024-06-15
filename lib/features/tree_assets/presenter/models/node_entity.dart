import 'package:flutter_tractian_challenge/features/tree_assets/domain/entities/asset_entity.dart';

class NodeEntity {
  final AssetEntity asset;
  final List<NodeEntity> children;

  const NodeEntity({
    required this.asset,
    required this.children,
  });

  String get id => asset.id;

  String get parentId => asset.parentId;

  @override
  String toString() {
    return '{"id": "$id.", "children": $children}';
  }
}
