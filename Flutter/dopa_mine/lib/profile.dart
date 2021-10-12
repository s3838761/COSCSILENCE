import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  List guardArr = ['Maria', 'Smith', 'mariasmith123@gmail.com'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                        'Firstname : ${childArr[0]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Lastname : ${childArr[1]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Email : ${childArr[3]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Age : ${childArr[2]}',
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
                  'Parent/Guardian Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 25, 20),
                      child: Text(
                        'Firstname : ${guardArr[0]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 0, 20),
                      child: Text(
                        'Lastname : ${guardArr[1]}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
                Text(
                  'Email : ${guardArr[2]}',
                  style: const TextStyle(fontSize: 16),
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
