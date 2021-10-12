import 'package:flutter/material.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  final int ticketTotal = 55;

  final rewardOptions = [
    CheckBoxState(title: 'Handful of Chocolate', cost: '100'),
    CheckBoxState(title: '1hr extra iPad time', cost: '150'),
    CheckBoxState(title: '\$20', cost: '400'),
    CheckBoxState(title: 'Choice of movie for Movie Night', cost: '250')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 30),
              child: Text(
                'Rewards!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
            ),
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.local_play_outlined,
                    size: 50,
                  ),
                ),
                Text(
                  'Total Number of Tickets: $ticketTotal',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                )
              ],
            ),
            ...rewardOptions.map(buildCheckbox).toList(),
            ElevatedButton(onPressed: () {}, child: const Text('Redeem'))
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
