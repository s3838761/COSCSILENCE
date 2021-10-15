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
              const Text(
                "Overview",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 350,
                height: 200,
                color: Colors.white24,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'Current Task:',
                            style: TextStyle(fontSize: 18),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 60),
                            child: Text(
                              'Wash the dog',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Total Tickets:',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 75),
                            child: Text(
                              '55',
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'So far you\'re doing fantastic!',
                      style: TextStyle(fontSize: 22),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15, top: 10),
                      child: Text(
                        'You\'ve completed 3 tasks!',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                'Reward Progression',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 30.0,
                  animationDuration: 2500,
                  percent: childArr[4] / childArr[5],
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.lightGreenAccent.shade700,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
}
