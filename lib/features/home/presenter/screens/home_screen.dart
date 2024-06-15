import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tractian_challenge/features/home/presenter/stores/home_store.dart';
import 'package:flutter_tractian_challenge/features/home/presenter/widgets/unity_box_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _store = Modular.get<HomeStore>();
  @override
  void initState() {
    _store.getAllUnits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          centerTitle: true,
          title: SvgPicture.asset(
            'assets/svgs/logo.svg',
            width: 126,
          ),
        ),
        body: Observer(builder: (_) {
          if (_store.isLoading) return const Center(child: CircularProgressIndicator());
          final unities = _store.unities;
          if (unities.isEmpty) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, top: 30, bottom: 30),
            child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (_, __) => const SizedBox(height: 40),
                itemBuilder: (_, index) => UnityBoxWidget(unity: unities[index])),
          );
        }));
  }
}
