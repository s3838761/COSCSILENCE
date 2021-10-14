import 'package:dopa_mine/rewards_guardian.dart';
import 'package:flutter/material.dart';
import 'package:dopa_mine/tasks.dart';
import 'package:dopa_mine/rewards.dart';
import 'package:dopa_mine/profile.dart';
import 'package:dopa_mine/home.dart';
import 'package:dopa_mine/home_guardian.dart';
import 'package:dopa_mine/tasks_guardian.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: const SelectionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ParentalView()));
              },
              child: const Text('Parental View'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const ChildView()));
              },
              child: const Text('Child View'),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class ChildView extends StatefulWidget {
  const ChildView({Key? key}) : super(key: key);

  @override
  _ChildViewState createState() => _ChildViewState();
}

class _ChildViewState extends State<ChildView> {
  int currentIndex = 0;

  final screens = [
    const HomePage(),
    const TasksPage(),
    const RewardsPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          // Bottom Nav Stlye
          backgroundColor: Colors.amber.shade200,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          // Bottom Nav navigation
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_task_outlined), label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_play_outlined), label: 'Rewards'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}

class ParentalView extends StatefulWidget {
  const ParentalView({Key? key}) : super(key: key);

  @override
  _ParentalViewState createState() => _ParentalViewState();
}

class _ParentalViewState extends State<ParentalView> {
  int currentIndex = 0;

  final screens = [
    const HomePageGuardian(),
    const TasksPageGuardian(),
    const RewardsPageGuardian(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          // Bottom Nav Stlye
          backgroundColor: Colors.amber.shade200,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          // Bottom Nav navigation
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_task_outlined), label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_play_outlined), label: 'Rewards'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
}
