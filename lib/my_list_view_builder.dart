import 'dart:math';

import 'package:flutter/material.dart';

class MyListViewBuilder extends StatefulWidget {
  const MyListViewBuilder({super.key});

  @override
  State<MyListViewBuilder> createState() => _MyListViewBuilderState();
}

class _MyListViewBuilderState extends State<MyListViewBuilder> {
  final ValueNotifier<bool> _switch = ValueNotifier<bool>(false);

  // final List<String> _list = <String>['a', 'b', 'bv', 'b', 'bd', 'b', 'bs', 'b', 'b', 'bg', 'b', 'bf', 'bd', 'bs', 'sbs', 'bs', 'bs', 'bs', 'bs', 'fbs', 'bs', 'sbs', 'ebs', 'bs', 'sbs', 'bs', 'abs'];
  final List<String> _list = <String>[];

  final List<String> _currentList = <String>[];
  int _startIndex = 0;
  final int _count = 3;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 100; i++) {
      _list.add(makeString(5));
    }

    _xx();
  }

  void _xx() {
    for (int i = _startIndex; i < _startIndex + _count; i++) {
      _currentList.add(_list[i]);
    }

    _startIndex += _count;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 100,
            height: 700,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: ListenableBuilder(
              listenable: _switch,
              builder: (BuildContext context, Widget? child) {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  itemCount: _currentList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                          child: Text(_currentList[index]),
                        ),
                        Visibility(
                          visible: _currentList.length - 1 == index,
                          child: ElevatedButton(
                            onPressed: () {
                              _xx();
                              _switch.value = !_switch.value;
                            },
                            child: Text('++++++++'),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 100,
            height: 800,
            decoration: BoxDecoration(border: Border.all(color: Colors.teal)),
            child: ListenableBuilder(
              listenable: _switch,
              builder: (BuildContext context, Widget? child) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  itemCount: _list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                          child: Text(_list[index]),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String makeString(int length) {
    return List<String>.generate(length, (_) => 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890'[Random().nextInt('AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890'.length)]).join();
  }

  @override
  void dispose() {
    _switch.dispose();
    super.dispose();
  }
}
