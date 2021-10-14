import 'package:flutter/material.dart';

class RewardsPageGuardian extends StatefulWidget {
  const RewardsPageGuardian({Key? key}) : super(key: key);

  @override
  _RewardsPageGuardianState createState() => _RewardsPageGuardianState();
}

final _numbers = ['10', '20', '30', '40', '50', '60', '70', '80', '90', '100'];
String? value;

class _RewardsPageGuardianState extends State<RewardsPageGuardian> {
  final int ticketTotal = 55;
  final _formKey = GlobalKey<FormState>();
  final rewardOptions = [
    CheckBoxState(title: 'Handful of Chocolate', cost: '100'),
    CheckBoxState(title: '1hr extra iPad time', cost: '150'),
    CheckBoxState(title: '\$20', cost: '400'),
    CheckBoxState(title: 'Choice of movie for Movie Night', cost: '250')
  ];

  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                'Rewards Options',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
            ),
            ...rewardOptions.map(buildCheckbox).toList(),
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Add Rewards Option',
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
                            labelText: 'Reward Title :',
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        expands: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Insert Reward Name';
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
                            padding: EdgeInsets.fromLTRB(10, 0, 200, 0),
                            child: Text('Reward Price :',
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
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Adding Reward Option...')));
                  }
                },
                child: const Text('Add Reward'))
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
        secondary: const Icon(Icons.local_play),
        subtitle: Text('Cost: ${checkbox.cost} tickets'),
      );
}

DropdownMenuItem<String> buildMenuItem(String _numbers) => DropdownMenuItem(
      value: _numbers,
      child: Text(_numbers),
    );

class CheckBoxState {
  final String title;
  final String cost;
  bool value;

  CheckBoxState({
    required this.title,
    required this.cost,
    this.value = false,
  });
}
