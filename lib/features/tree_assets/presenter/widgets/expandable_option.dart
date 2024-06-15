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

  bool get canExpanded => widget.node.children.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return isExpanded ? _expandedView() : _baseRow();
  }

  Widget _expandedView() {
    return Column(
      children: [
        _baseRow(),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: TreeAssetsWidget(nodes: widget.node.children),
        ),
      ],
    );
  }

  Widget _baseRow() {
    return InkWell(
      onTap: () {
        if (canExpanded) {
          setState(() {
            isExpanded = !isExpanded;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _arrowWidget(),
            Image.asset(widget.node.asset.typeItem.pathIcon, height: 22),
            const SizedBox(width: 4),
            Text(widget.node.asset.name, style: Theme.of(context).textTheme.labelMedium)
          ],
        ),
      ),
    );
  }

  Widget _arrowWidget() => Visibility(
        visible: canExpanded,
        child: Row(
          children: [
            Transform.rotate(
                angle: isExpanded ? (3 * pi) / 2 : pi,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                )),
            const SizedBox(width: 6)
          ],
        ),
      );
}
