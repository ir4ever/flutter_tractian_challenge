import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tractian_challenge/core/theme/app_colors.dart';
import 'package:flutter_tractian_challenge/features/home/domain/entities/unity_entity.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/constants/constants.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/stores/asset_store.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/widgets/custom_text_field_widget.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/widgets/filter_assets_widget.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/widgets/tree_assets_widget.dart';

class AssetsScreen extends StatefulWidget {
  final UnityEntity unity;

  const AssetsScreen({super.key, required this.unity});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  final _store = Modular.get<AssetStore>();

  @override
  void initState() {
    _store.getAllLocationsByCompany(widget.unity.id);
    _store.getAllAssetsByCompany(widget.unity.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: IconButton(
            onPressed: () {
              Modular.to.pop();
            },
            icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          ),
          centerTitle: true,
          title: Text('Assets', style: Theme.of(context).textTheme.labelLarge)),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const CustomTextFieldWidget(),
                const SizedBox(height: 8),
                FilterAssetsWidget(
                  options: filterOptions,
                  onChanged: (option) {},
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Divider(color: AppColors.dividerLightGray),
          Expanded(
            child: SingleChildScrollView(
              child: Observer(builder: (_) {
                return TreeAssetsWidget(nodes: _store.nodes);
              }),
            ),
          )
        ],
      ),
    );
  }
}
