import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tractian_challenge/app_module.dart';
import 'package:flutter_tractian_challenge/core/theme/themes.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Tractian Challenge',
      theme: AppThemes.themeDefault,
      routerConfig: Modular.routerConfig,
    );
  }
}
