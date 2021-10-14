import 'package:flutter/material.dart';

class TasksPageGuardian extends StatefulWidget {
  const TasksPageGuardian({Key? key}) : super(key: key);

  @override
  _TasksPageGuardianState createState() => _TasksPageGuardianState();
}

class _TasksPageGuardianState extends State<TasksPageGuardian> {
  final _formKey = GlobalKey<FormState>();
  late final List taskArr = [
    'Clean Bathroom',
    'Do History Homework',
    'Feed the Dog',
    'Learn the 9 times table'
  ];
  final _numbers = [
    '10',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
    '80',
    '90',
    '100'
  ];
  String? value;
  final rewardOptions = [
    CheckBoxState(title: 'Clean Bathroom'),
    CheckBoxState(title: 'Do History Homework'),
    CheckBoxState(title: 'Feed the Dog'),
    CheckBoxState(title: 'Learn the 9 times table')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                'Child Progress',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
            ),
            ...rewardOptions.map(buildCheckbox).toList(),
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Add Task Option',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Task Title :',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        expands: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Insert Task Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 100, 0),
                            child: Text('Task Completion Price :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.black38)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value,
                                items: _numbers.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                    setState(() => this.value = value),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Adding Task Option...')));
                  }
                },
                child: const Text('Add Task'))
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

  DropdownMenuItem<String> buildMenuItem(String _numbers) => DropdownMenuItem(
        value: _numbers,
        child: Text(_numbers),
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
