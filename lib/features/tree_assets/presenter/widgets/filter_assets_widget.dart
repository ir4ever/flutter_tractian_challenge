import 'package:flutter/material.dart';
import 'package:flutter_tractian_challenge/core/theme/app_colors.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/models/filter_asset_option_model.dart';

class FilterAssetsWidget extends StatefulWidget {
  final List<FilterAssetOptionModel> options;

  final Function(FilterAssetOptionModel) onChanged;

  const FilterAssetsWidget({super.key, required this.options, required this.onChanged});

  @override
  State<FilterAssetsWidget> createState() => _FilterAssetsWidgetState();
}

class _FilterAssetsWidgetState extends State<FilterAssetsWidget> {
  int? selectedIndex;

  (BorderSide, Color) style(int index) {
    if (selectedIndex == index) {
      return (BorderSide.none, AppColors.white);
    }
    return (BorderSide(color: AppColors.borderLightGray, width: 1, strokeAlign: 1), AppColors.darkGray);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        itemCount: widget.options.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) => const SizedBox(width: 8.0),
        itemBuilder: (_, index) {
          final (borderSide, contentColor) = style(index);
          final option = widget.options[index];
          return OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  side: borderSide,
                  backgroundColor: index == selectedIndex ? Theme.of(context).colorScheme.primary : null,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
              onPressed: () {
                widget.onChanged(option);
                setState(() {
                  if (selectedIndex == index) {
                    selectedIndex = null;
                  } else {
                    selectedIndex = index;
                  }
                });
              },
              child: Row(
                children: [
                  Icon(option.icon, color: contentColor, size: 18),
                  const SizedBox(width: 6),
                  Text(option.name, style: TextStyle(color: contentColor, fontSize: 14, fontWeight: FontWeight.w500))
                ],
              ));
        },
      ),
    );
  }
}
