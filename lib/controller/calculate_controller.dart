import 'package:calculator/controller/result_controller.dart';
import 'package:calculator/controller/shared_preferences.dart';
import 'package:calculator/controller/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculateProvider = StateNotifierProvider((ref) {
  return CalculateController(ref);
});

bool isFirst = false;
double result = 0;
String assignValue = "";
String inputStatevalue = "";

List<String?> inputStringList = [];

class CalculateController extends StateNotifier {
  CalculateController(this.ref) : super('0');
  final Ref ref;
  void setStateVal(var val) {
    state = val;
  }

  void calculate(String input) {
    if (input == "1" ||
        input == "2" ||
        input == "3" ||
        input == "4" ||
        input == "5" ||
        input == "6" ||
        input == "7" ||
        input == "8" ||
        input == "9" ||
        input == "0" ||
        input == ".") {
      assignValue += input;
      inputStatevalue += input;
      state = inputStatevalue;
      isFirst = true;
    } else if (input == "+" ||
        input == "-" ||
        input == "x" ||
        input == "/" ||
        input == "%" && isFirst) {
      inputStringList.add(assignValue);
      inputStringList.add(input);
      assignValue = "";
      inputStatevalue += input;
      state = inputStatevalue;
      isFirst = false;
    } else if (input == "C") {
      result = 0;
      assignValue = "";
      inputStatevalue = "";
      isFirst = false;
      state = "0";
      inputStringList.clear();
      ref.read(resultProvider.notifier).clear();
    } else if (isFirst && input == "=") {
      inputStringList.add(assignValue);
      result = double.parse(inputStringList[0]!);
      for (int i = 0; i < inputStringList.length; i++) {
        if (inputStringList[i] == "+") {
          result += double.parse(inputStringList[i + 1]!);
        } else if (inputStringList[i] == "-") {
          result -= double.parse(inputStringList[i + 1]!);
        } else if (inputStringList[i] == "x") {
          result *= double.parse(inputStringList[i + 1]!);
        } else if (inputStringList[i] == "/") {
          result /= double.parse(inputStringList[i + 1]!);
        } else if (inputStringList[i] == "%") {
          result %= double.parse(inputStringList[i + 1]!);
        }
      }
      SP().addInputSP(inputStatevalue);
      ref.read(resultProvider.notifier).show(result.toString());
    } else if (input == "DEL" && assignValue.length > 0) {
      inputStatevalue =
          inputStatevalue.substring(0, inputStatevalue.length - 1);
      state = inputStatevalue;
      assignValue = assignValue.substring(0, assignValue.length - 1);
    } else {}
  }
}
