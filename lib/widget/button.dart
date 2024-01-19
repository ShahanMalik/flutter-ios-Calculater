import 'package:calculator/controller/calculate_controller.dart';
import 'package:calculator/screen/shared_preferences.dart';
import 'package:calculator/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomButton extends ConsumerWidget {
  const CustomButton({
    super.key,
    required this.index,
    required this.width,
    required this.height,
    required this.buttons,
  });
  final int index;
  final double width;
  final double height;
  final List<String> buttons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width * 0.23,
      height: height * 0.11,
      child: Material(
        color: index == 0 || index == 1 || index == 2
            ? ButtonColors.white
            : index == 7 ||
                    index == 11 ||
                    index == 15 ||
                    index == 19 ||
                    index == 3
                ? ButtonColors.yellow
                : index == 16 || index == 17 || index == 18
                    ? ButtonColors.dark
                    : ButtonColors.dark,
        borderRadius: BorderRadius.circular(50), // Makes it round
        child: InkWell(
          highlightColor: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            if (index == 18) {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => SharedPre(),
                ),
              );
            } else {
              ref.read(calculateProvider.notifier).calculate(buttons[index]);
            }
            // ref.read(resultProvider.notifier);
          },
          child: index == 15
              ? Center(
                  child: Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                    size: height * 0.04,
                  ),
                )
              : index == 11
                  ? Center(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: height * 0.04,
                      ),
                    )
                  : index == 7
                      ? Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: height * 0.04,
                          ),
                        )
                      : Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            buttons[index],
                            style: TextStyle(
                              color: index == 0 || index == 1 || index == 2
                                  ? Color.fromARGB(255, 0, 0, 0)
                                  : Color.fromARGB(255, 255, 251, 251),
                              fontSize: index == 18
                                  ? height * 0.03
                                  : index == 1
                                      ? height * 0.03
                                      : height * 0.04,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
        ),
      ),
    );
  }
}
