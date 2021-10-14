import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List childArr = [
    'John',
    'Smith',
    12,
    'johnsmith@gmail.com',
    /*Tickets*/ 120,
    /*Tickets desired*/ 150
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.red.shade100, Colors.blue.shade100])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              const Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                childArr[0],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              const Spacer(),
              Container(
                width: 300,
                height: 300,
                color: Colors.black26,
              ),
              const Spacer(),
              const Text(
                'Reward Progression',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 30.0,
                  animationDuration: 2500,
                  percent: childArr[4] / childArr[5],
                  center: Text(
                    '%${(childArr[4] / childArr[5] * 100)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.green,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
}
