import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> userArr = ['John', 'Smith', '12', 'johnsmith@gmail.com'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: <Widget>[
                Column(),
                Column(
                  children: <Widget>[
                    Text('Firstname: ${userArr[0]}'),
                    Text('Lastname: ${userArr[1]}'),
                    Text('Email: ${userArr[3]}'),
                    Text('Age: ${userArr[2]}'),
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Parent/Guardian Information',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
