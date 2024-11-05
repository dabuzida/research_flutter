import 'package:flutter/material.dart';
import 'package:research_flutter/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '12345',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('asdf'),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: const MyApp2(),
      ),
    );
  }
}

class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  final ScrollController _scrollControllerLeftList = ScrollController();
  final ScrollController _scrollControllerRightContent = ScrollController();

  Targets _currentTarget = Targets.values.last;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: ListView.builder(
            controller: _scrollControllerLeftList,
            itemCount: Targets.values.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                // height: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      _currentTarget == Targets.values[index] ? Colors.amber : Colors.green,
                    ),
                  ),
                  child: Text(Targets.values[index].title),
                  onPressed: () {
                    _currentTarget = Targets.values[index];
                    setState(() {});
                  },
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 90,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  controller: _scrollControllerRightContent,
                  children: <Widget>[
                    _currentTarget.widget,
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
