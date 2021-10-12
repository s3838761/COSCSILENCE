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
    /*Tickets desired*/ 150,
    /*Completed Tasks*/ 3,
    /*Uncompleted Tasks*/ 8,
  ];

  List guardArr = ['Maria', 'Smith', 'mariasmith123@gmail.com'];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              const Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                guardArr[0],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              const Spacer(),
              const Text('Overview',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Container(
                width: 300,
                height: 300,
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Child Name: ${childArr[0]} ${childArr[1]}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(right: 75),
                            child: Text('Current Task: '),
                          ),
                          const Text('Unknown name yet')
                        ],
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(right: 75),
                            child: Text('Current Task: '),
                          ),
                          const Text('Unknown name yet')
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                'Child’s Reward Progression!',
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
