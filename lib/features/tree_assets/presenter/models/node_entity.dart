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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NodeEntity && runtimeType == other.runtimeType && asset == other.asset && children == other.children;

  @override
  int get hashCode => asset.hashCode ^ children.hashCode;

  NodeEntity copyWith({
    AssetEntity? asset,
    List<NodeEntity>? children,
  }) {
    return NodeEntity(
      asset: asset ?? this.asset,
      children: children ?? this.children,
    );
  }
}
