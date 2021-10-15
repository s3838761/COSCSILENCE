import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePageGuardian extends StatefulWidget {
  const HomePageGuardian({Key? key}) : super(key: key);

  @override
  _HomePageGuardianState createState() => _HomePageGuardianState();
}

class _HomePageGuardianState extends State<HomePageGuardian> {
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
                guardArr[0],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              const Spacer(),
              const Text('Overview',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              Container(
                width: 350,
                height: 200,
                color: Colors.white24,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Child Name: ${childArr[0]}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                'Completed Tasks:',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 45),
                              child: Text(
                                '3',
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
                                'Uncompleted Tasks:',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Text(
                                '2',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
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
