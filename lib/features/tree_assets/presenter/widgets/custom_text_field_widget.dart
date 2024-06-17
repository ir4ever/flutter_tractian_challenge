import 'package:flutter/material.dart';
import 'package:flutter_tractian_challenge/core/theme/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final Function(String) onChanged;

  const CustomTextFieldWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: TextField(
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.gray),
          onChanged: onChanged,
          cursorHeight: 18,
          decoration: InputDecoration(
              hintText: 'Buscar Ativo ou Local',
              filled: true,
              fillColor: AppColors.lightGray,
              prefixIconConstraints: const BoxConstraints.tightForFinite(width: 42),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.search,
                  color: AppColors.gray,
                  size: 18,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(4),
              ),
              hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.gray),
              contentPadding: EdgeInsets.zero)),
    );
  }
}
