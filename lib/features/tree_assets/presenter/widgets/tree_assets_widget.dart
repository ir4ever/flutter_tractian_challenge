import 'package:flutter/material.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/models/node_entity.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/widgets/expandable_asset_widget.dart';

class TreeAssetsWidget extends StatelessWidget {
  final List<NodeEntity> nodes;

  const TreeAssetsWidget({super.key, required this.nodes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: nodes.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return ExpandableAssetWidget(node: nodes[index]);
        });
  }
}
