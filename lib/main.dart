import 'package:flutter/material.dart';

import 'my_checkbox.dart';

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
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  Widget _currentTarget = Targets.values.first.widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: Targets.values.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.only(bottom: 5.0),
                height: 100,
                child: ElevatedButton(
                  child: Text(Targets.values[index].title),
                  onPressed: () {
                    _currentTarget = Targets.values[index].widget;
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
                  controller: _scrollController2,
                  children: <Widget>[
                    _currentTarget,
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

enum Targets {
  aa1('첫 페이지', Placeholder()),
  aaa('checkbox', MyCheckbox()),
  bbb2('1', MyCheckbox()),
  bbb23('2', MyCheckbox()),
  bb2b3('3', MyCheckbox()),
  bb4b3('4', MyCheckbox()),
  bb44b3('5', MyCheckbox()),
  bb4b33('6', MyCheckbox()),
  bb524b3('7', MyCheckbox()),
  bbb53('8', MyCheckbox()),
  ;

  const Targets(this.title, this.widget);

  final String title;
  final Widget widget;
}
