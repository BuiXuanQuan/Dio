import 'package:flutter/material.dart';
import 'dart:convert';
import 'model.dart';

import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var user;

  var dio = Dio();
  String text = " ";
  int userId;
  int id;
  String title;
  bool completed;

  String baseUrl =
      'https://jsonplaceholder.typicode.com/todos/1?fbclid=IwAR393NYfJlznxRQMR_9_2raljvo-x9ARHH_h-PEB23U8SH23F7nj6nMqyA0';

  // Future<String> getHttp1() async {
  //   User.fromJson(baseUrl);
  // }

  Future<User> getHttp() async {
    try {
      Response response = await dio.get(baseUrl);

      return User.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.green,
              onPressed: () {
                getHttp().then((r) {
                  setState(() {
                    text = r.toString();
                  });
                });
                print(text);
                // print(user.toJson()["id"]);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                ' Get Data',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
