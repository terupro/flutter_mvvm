import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm/model/home_page_state.dart';
import 'package:flutter_mvvm/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view_model/home_page_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // state（状態）
    final _homePageState = ref.watch(homePageProvider);
    // provider（状態の操作）
    final _homePageNotifier = ref.watch(homePageProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter MVVM')),
      floatingActionButton: FloatingActionButton(
        onPressed: _homePageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Main Count ${_homePageState.mainCount}'),
            onTap: _homePageNotifier.increaseMainCount,
          ),
          ListTile(
            title: Text('Sub Count ${_homePageState.subCount}'),
            onTap: _homePageNotifier.increaseSubCount,
          ),
        ],
      ),
    );
  }
}
