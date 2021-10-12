import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tasks = <String>[
      'Task',
      'Task',
      'Task',
      'Task',
      'Task',
    ];

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected.add(Fortune.randomInt(0, tasks.length));
          });
        },
        child: Column(
          children: <Widget>[
            const Spacer(),
            Expanded(
                child: FortuneBar(
              animateFirst: false,
              styleStrategy: const AlternatingStyleStrategy(),
              selected: selected.stream,
              items: [
                for (var it in tasks)
                  FortuneItem(
                    child: Text(it),
                    style: const FortuneItemStyle(
                      borderColor: Colors.black,
                      borderWidth: 3,
                    ),
                  ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
