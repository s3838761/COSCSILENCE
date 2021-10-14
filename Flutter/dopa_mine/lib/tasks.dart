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

  late final List<String> taskArr = [
    'Clean Bathroom',
    'Do History Homework',
    'Feed the Dog',
    'Learn the 9 times table'
  ];

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  final rewardOptions = [
    CheckBoxState(title: 'Clean Bathroom'),
    CheckBoxState(title: 'Do History Homework'),
    CheckBoxState(title: 'Feed the Dog'),
    CheckBoxState(title: 'Learn the 9 times table')
  ];

  @override
  Widget build(BuildContext context) {
    final tasks = <String>[
      'Task1',
      'Task2',
      'Task3',
      'Task4',
      'Task5',
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
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 30),
              child: Text(
                'Task Picker',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
            ),
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
              ),
            ),
            ...rewardOptions.map(buildCheckbox).toList(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget buildCheckbox(CheckBoxState checkbox) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkbox.value,
        onChanged: (value) => setState(() => checkbox.value = value!),
        title: Text(checkbox.title),
      );
}

class CheckBoxState {
  final String title;
  bool value;

  CheckBoxState({
    required this.title,
    this.value = false,
  });
}
