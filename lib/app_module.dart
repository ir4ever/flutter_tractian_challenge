import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tractian_challenge/core/core_module.dart';
import 'package:flutter_tractian_challenge/features/home/home_module.dart';
import 'package:flutter_tractian_challenge/features/home/presenter/screens/home_screen.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/asset_module.dart';
import 'package:flutter_tractian_challenge/features/tree_assets/presenter/screens/assets_screen.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule(), HomeModule(), AssetModule()];

  @override
  void routes(r) {
    r.child('/', child: (_) => const HomeScreen());
    r.child('/tree_assets', child: (_) => AssetsScreen(unity: r.args.data));
    /*r.module('/', module: HomeModule());
    r.module('/tree_assets', module: AssetModule());*/
  }
}
