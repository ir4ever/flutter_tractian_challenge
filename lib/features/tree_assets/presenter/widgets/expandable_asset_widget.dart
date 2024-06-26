import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tractian_challenge/core/enuns/assets_enum.dart';
import 'package:flutter_tractian_challenge/core/theme/app_colors.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/domain/entities/asset_entity.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/models/node_entity.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/painters/path_line_painter.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/widgets/tree_assets_widget.dart';

class ExpandableAssetWidget extends StatefulWidget {
  final NodeEntity node;
  const ExpandableAssetWidget({super.key, required this.node});

  @override
  State<ExpandableAssetWidget> createState() => _ExpandableAssetWidgetState();
}

class _ExpandableAssetWidgetState extends State<ExpandableAssetWidget> {
  bool isExpanded = false;

  bool get canExpanded => widget.node.children.isNotEmpty;

  bool get linkLine => !canExpanded && asset.typeItem == TypeItemEnum.COMPONENT && !asset.isRoot;

  AssetEntity get asset => widget.node.asset;

  double get endSizeLine =>
      widget.node.children.isNotEmpty && widget.node.children.last.asset.typeItem == TypeItemEnum.COMPONENT ? 20 : 18;

  @override
  Widget build(BuildContext context) {
    return isExpanded ? _expandedView() : _baseRow();
  }

  Widget _expandedView() {
    return Column(
      children: [
        _baseRow(),
        CustomPaint(
          painter: PathLinePainter(endSize: endSizeLine),
          child: Column(
            children: [
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TreeAssetsWidget(nodes: widget.node.children),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _baseRow() {
    return GestureDetector(
      onTap: () {
        if (canExpanded) {
          setState(() {
            isExpanded = !isExpanded;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(linkLine ? 0 : 8, 8, 8, 8),
        child: Row(
          children: [
            _arrowWidget(),
            Image.asset(asset.typeItem.pathIcon, height: 22),
            const SizedBox(width: 4),
            Text(asset.name, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(width: 4),
            _statusIcon()
          ],
        ),
      ),
    );
  }

  Widget _statusIcon() {
    if (asset.typeItem != TypeItemEnum.COMPONENT || asset.assetStatus == null) {
      return const SizedBox.shrink();
    }
    if (asset.assetStatus == AssetStatusEnum.OPERATING) {
      return Icon(Icons.flash_on, color: AppColors.green, size: 12);
    }
    return Icon(Icons.circle, color: AppColors.red, size: 12);
  }

  Widget _arrowWidget() {
    if (!canExpanded && (asset.typeItem != TypeItemEnum.COMPONENT || asset.isRoot)) {
      return const SizedBox.shrink();
    }
    if (linkLine) {
      return Container(
        height: 1,
        width: 15,
        color: AppColors.lineGray,
        margin: const EdgeInsets.only(right: 4),
      );
    }
    return Row(
      children: [
        Transform.rotate(
            angle: isExpanded ? (3 * pi) / 2 : pi,
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 16,
            )),
        const SizedBox(width: 6)
      ],
    );
  }
}
