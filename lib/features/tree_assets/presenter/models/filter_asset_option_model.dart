import 'package:flutter/material.dart';
import 'package:flutter_tractian_challenge/core/enuns/assets_enum.dart';

class FilterAssetOptionModel {
  final String name;
  final IconData icon;
  final AssetStatusEnum status;

  const FilterAssetOptionModel({required this.name, required this.icon, required this.status});
}
