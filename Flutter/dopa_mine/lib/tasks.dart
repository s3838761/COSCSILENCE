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
    CheckBoxState(title: 'Take out the Trash')
  ];

  @override
  Widget build(BuildContext context) {
    final tasks = <String>[
      'Clean the Dishes',
      'Take out the Trash',
      'Paint the fence',
    ];

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected.add(Fortune.randomInt(0, tasks.length));
          });
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.red.shade100, Colors.blue.shade100])),
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
              const Text(
                'Task Selected: ',
                style: TextStyle(fontSize: 24),
              ),
              const Spacer(),
              ...rewardOptions.map(buildCheckbox).toList(),
              const Spacer(),
            ],
          ),
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
