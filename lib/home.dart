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
  int userId = 1;
  String id = 'asd';
  String title = "hihi";
  bool completed = true;

  String baseUrl = 'https://jsonplaceholder.typicode.com/todos/1';

  // Future<String> getHttp1() async {
  //   User.fromJson(baseUrl);
  // }

  Future<String> getHttp() async {
    try {
      Response response = await dio.get(baseUrl);

      Map data = jsonDecode(response.toString());

      id = data['id'];
      userId = data['userId'];
      title = data['title'].toString();
      completed = data['completed'];

      user = User(id: id, userId: userId, title: title, completed: completed);
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
                print(user.toJson()["id"]);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                ' Get Data',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(id)
          ],
        ),
      ),
    );
  }
}
