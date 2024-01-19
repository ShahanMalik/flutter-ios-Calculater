import 'package:calculator/controller/calculate_controller.dart';
import 'package:calculator/controller/result_controller.dart';
import 'package:calculator/controller/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPre extends StatefulWidget {
  const SharedPre({super.key});

  @override
  _SharedPreState createState() => _SharedPreState();
}

class _SharedPreState extends State<SharedPre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  ResultList.clear();
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setStringList('myStringList', ResultList);
                  });
                  inputList.clear();
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setStringList('myinputList', inputList);
                  });
                });
              },
              icon: Icon(Icons.delete, color: Colors.red))
        ],
        elevation: 0.1,
        shadowColor: Colors.blueGrey[900],
        title: Text("Calculation history",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 219, 219, 219))),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        toolbarHeight: 80,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ResultList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blueGrey[800],
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onTap: () {},
                        leading: Consumer(
                          builder: (context, ref, child) {
                            return IconButton(
                              onPressed: () {
                                setState(() {
                                  final r1 = inputList[index];
                                  final r2 = ResultList[index];
                                  ref
                                      .watch(calculateProvider.notifier)
                                      .setStateVal(r1);
                                  ref
                                      .watch(resultProvider.notifier)
                                      .setStateVal(r2);

                                  Navigator.pop(context);
                                });
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blueGrey[100],
                              ),
                            );
                          },
                        ),
                        subtitle: Text(
                          ResultList[index],
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueGrey[100],
                          ),
                        ),
                        title: Text(
                          inputList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.blueGrey[100],
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(
                              () {
                                ResultList.removeAt(index);
                                SharedPreferences.getInstance().then(
                                  (prefs) {
                                    prefs.setStringList(
                                        'myStringList', ResultList);
                                  },
                                );
                                inputList.removeAt(index);
                                SharedPreferences.getInstance().then(
                                  (prefs) {
                                    prefs.setStringList(
                                        'myinputList', inputList);
                                  },
                                );
                              },
                            );
                          },
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
