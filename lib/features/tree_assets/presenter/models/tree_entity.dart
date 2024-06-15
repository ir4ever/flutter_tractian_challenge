import 'package:flutter_tractian_challenge/features/tree_assets/domain/entities/asset_entity.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/models/node_entity.dart';

class TreeEntity {
  final List<AssetEntity> roots;
  final List<NodeEntity> children;

  const TreeEntity({
    required this.roots,
    required this.children,
  });
}
