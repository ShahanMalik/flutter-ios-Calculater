import 'package:calculator/controller/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resultProvider = StateNotifierProvider.autoDispose((ref) {
  return ShowNotifier();
});

class ShowNotifier extends StateNotifier {
  ShowNotifier() : super('0');
  void setStateVal(var val) {
    state = val;
  }

  void show(String value) {
    state = value;
    SP().addResultSp(state);
  }

  void clear() {
    state = '0';
  }
}
