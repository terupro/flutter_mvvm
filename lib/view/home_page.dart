import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm/models/home_page.state.dart';
import 'package:flutter_mvvm/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view_models/home_page_notifier.dart';

final homePageNotifierProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>((ref) {
  // Readerを渡す
  return HomePageNotifier(ref.read);
});

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // HomePageState 値を描画する
    final pageState = ref.watch(homePageNotifierProvider);
    // HomePageNotifier クラスのメソッドを使える
    final pageNotifier = ref.watch(homePageNotifierProvider.notifier);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: pageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Main Count ${pageState.mainCount}'),
            onTap: pageNotifier.increaseMainCount,
          ),
          ListTile(
            title: Text('Sub Count ${pageState.subCount}'),
            onTap: pageNotifier.increaseSubCount,
          ),
        ],
      ),
    );
  }
}
