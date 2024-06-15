import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/stores/asset_store.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/widgets/expandable_option.dart';

class TreeAssetsWidget extends StatefulWidget {
  final AssetStore store;
  const TreeAssetsWidget({super.key, required this.store});

  @override
  State<TreeAssetsWidget> createState() => _TreeAssetsWidgetState();
}

class _TreeAssetsWidgetState extends State<TreeAssetsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(builder: (_) {
        final roots = widget.store.nodes;
        return ListView.builder(
            itemCount: roots.length,
            itemBuilder: (_, index) {
              return ExpandableOption(asset: roots[index].asset);
            });
      }),
    );
  }
}
