import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toffee_ride/models/lesson/lesson_model.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, data) {
            var items = data.data as List<LessonModal>;
            return SafeArea(child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  width: 150,
                  child: Column(
                    children: [Text(items[index].pages[index].text[index])],
                  ),
                );
              },
            ));
          }),
    );
  }

  Future<List<LessonModal>> ReadJsonData() async {
    final jsondata =
        await rootBundle.loadString('assets/jsons/model/activity_model.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => LessonModal.fromJson(e)).toList();
  }
}
