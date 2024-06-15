import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/models/node_entity.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/widgets/tree_assets_widget.dart';

class ExpandableOption extends StatefulWidget {
  final NodeEntity node;

  const ExpandableOption({super.key, required this.node});

  @override
  State<ExpandableOption> createState() => _ExpandableOptionState();
}

class _ExpandableOptionState extends State<ExpandableOption> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return Column(
        children: [_baseRow(), const SizedBox(height: 4), TreeAssetsWidget(nodes: widget.node.children)],
      );
    }
    return _baseRow();
  }

  Widget _baseRow() {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Transform.rotate(
                angle: isExpanded ? (3 * pi) / 2 : pi,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                )),
            const SizedBox(width: 6),
            Image.asset(widget.node.asset.typeItem.pathIcon, height: 22),
            const SizedBox(width: 4),
            Text(widget.node.asset.name, style: Theme.of(context).textTheme.labelMedium)
          ],
        ),
      ),
    );
  }
}
