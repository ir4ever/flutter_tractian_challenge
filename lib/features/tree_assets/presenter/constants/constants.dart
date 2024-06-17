import 'package:flutter/material.dart';
import 'package:flutter_tractian_challenge/core/enuns/assets_enum.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/models/filter_asset_option_model.dart';

const List<FilterAssetOptionModel> filterOptions = [
  FilterAssetOptionModel(name: 'Sensor de Energia', icon: Icons.flash_on, status: AssetStatusEnum.OPERATING),
  FilterAssetOptionModel(name: 'Crítico', icon: Icons.info_outline_rounded, status: AssetStatusEnum.ALERT)
];
