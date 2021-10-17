import 'package:flutter/material.dart';

class ProfilePageGuardian extends StatefulWidget {
  const ProfilePageGuardian({Key? key}) : super(key: key);

  @override
  _ProfilePageGuardianState createState() => _ProfilePageGuardianState();
}

class _ProfilePageGuardianState extends State<ProfilePageGuardian> {
  List childArr = [
    'John',
    'Smith',
    12,
    'johnsmith@gmail.com',
    /*Tickets*/ 120,
    /*Tickets desired*/ 150,
    /*Completed Tasks*/ 3,
    /*Uncompleted Tasks*/ 8,
  ];

  List guardArr = ['Maria', 'Smith', 'mariasmith@gmail.com'];

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
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 0.0),
                        borderRadius:
                            const BorderRadius.all(Radius.elliptical(100, 150)),
                        color: Colors.black12,
                        shape: BoxShape.rectangle),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Firstname : ${guardArr[0]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Lastname : ${guardArr[1]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Email : ${guardArr[2]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
                const Text(
                  'Child\'s Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 25, 20),
                      child: Text(
                        'Firstname : ${childArr[0]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 0, 20),
                      child: Text(
                        'Lastname : ${childArr[1]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 25, 20),
                      child: Text(
                        'Email : ${childArr[3]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 0, 20),
                      child: Text(
                        'Age : ${childArr[2]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Completed Tasks : ${childArr[6]}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Uncompleted Tasks : ${childArr[7]}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Current Task : Wash the Dog',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Tickets : ${childArr[5]}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Last Reward Earned : \$20 cash',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
