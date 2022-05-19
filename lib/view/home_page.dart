import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm/model/home_page.state.dart';
import 'package:flutter_mvvm/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view_model/home_page_notifier.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 値を描画する
    final _homePageState = ref.watch(homePageProvider);
    // クラスのメソッドを使える
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
