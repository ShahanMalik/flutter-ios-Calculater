import 'package:calculator/controller/calculate_controller.dart';
import 'package:calculator/controller/result_controller.dart';
import 'package:calculator/controller/shared_preferences.dart';
import 'package:calculator/utils/Color.dart';
import 'package:calculator/utils/constant.dart';
import 'package:calculator/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/animation.dart';

class CalculaterScreen extends StatefulWidget {
  const CalculaterScreen({super.key});

  @override
  State<CalculaterScreen> createState() => _CalculaterScreenState();
}

class _CalculaterScreenState extends State<CalculaterScreen>
    with SingleTickerProviderStateMixin {
  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    await SP().loadInputSPList();
    await SP().loadResultSPList();
    print(ResultList);
    print(inputList);
  }

  @override
  Widget build(BuildContext context) {
    final height = Constant.dh(context);
    final width = Constant.dw(context);
    return Scaffold(
      backgroundColor: ButtonColors.dark2,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: width,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          ref.watch(calculateProvider).toString(),
                          style: TextStyle(
                            fontSize: height * 0.04,
                            fontWeight: FontWeight.normal,
                            color: ButtonColors.white2,
                          ),
                        ),
                      );
                    },
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final result = ref.watch(resultProvider).toString();
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          result.toString(),
                          style: TextStyle(
                            fontSize: height * 0.09,
                            fontWeight: FontWeight.normal,
                            color: ButtonColors.white2,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.1, 0, 0.1, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        index: 0,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 1,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 2,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 3,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButton(
                        index: 4,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 5,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 6,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 7,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButton(
                        index: 8,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 9,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 10,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 11,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButton(
                        index: 12,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 13,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 14,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 15,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButton(
                        index: 16,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 17,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 18,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                      CustomButton(
                        index: 19,
                        width: width,
                        height: height,
                        buttons: buttons,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
