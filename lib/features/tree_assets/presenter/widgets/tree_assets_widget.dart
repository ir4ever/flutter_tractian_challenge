import 'package:flutter/material.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/models/node_entity.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/widgets/expandable_option.dart';

class TreeAssetsWidget extends StatelessWidget {
  final List<NodeEntity> nodes;

  const TreeAssetsWidget({super.key, required this.nodes});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: nodes.length,
            itemBuilder: (_, index) {
              return ExpandableOption(node: nodes[index]);
            }));
  }
}
