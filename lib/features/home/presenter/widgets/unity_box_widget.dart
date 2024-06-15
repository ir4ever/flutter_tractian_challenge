import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tractian_challenge/core/theme/app_colors.dart';
import 'package:flutter_tractian_challenge/features/home/domain/entities/unity_entity.dart';

class UnityBoxWidget extends StatelessWidget {
  final UnityEntity unity;

  const UnityBoxWidget({super.key, required this.unity});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        Modular.to.pushNamed('/tree_assets', arguments: unity);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 32),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Image.asset('assets/icons/boxes.png', height: 24, color: AppColors.white),
            const SizedBox(width: 16),
            Text(unity.name, style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      ),
    );
  }
}
