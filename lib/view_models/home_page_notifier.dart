import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mvvm/models/home_page.state.dart';

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier(this.read) : super(const HomePageState());
  // Reader 型をフィールドに持っておくことで、HomePageNotifierから他のProviderを読み取ることができるようになります
  final Reader read;

  // メインカウントを+1する
  void increaseMainCount() async {
    state = state.copyWith(mainCount: state.mainCount + 1);
  }

  // サブカウントを+1する
  void increaseSubCount() async {
    state = state.copyWith(subCount: state.subCount + 1);
  }

  // すべてのカウントを0に戻す
  void resetAllCount() async {
    state = state.copyWith(
      mainCount: 0,
      subCount: 0,
    );
  }
}
