import 'package:calculator/controller/calculate_controller.dart';
import 'package:calculator/controller/result_controller.dart';
import 'package:calculator/controller/shared_preferences.dart';
import 'package:calculator/utils/Color.dart';
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 19,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        shadowColor: Colors.black,
        title: Text("History",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 219, 219, 219))),
        centerTitle: true,
        backgroundColor: Colors.black,
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
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Card(
                      color: Color.fromARGB(19, 255, 255, 255),
                      child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onTap: () {},
                          title: Text(
                            inputList[index],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                          subtitle: Text(
                            ResultList[index],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.blueGrey[100],
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
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
                    ),
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
