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

// TODO: flutter_research 프로젝트는 첫화면이 리스트고 주제별 항목이 존재. 누르면 해당 주제에 대한 리서치를 다룸
class _MyApp2State extends State<MyApp2> {
  final ScrollController _scrollControllerLeftList = ScrollController();
  final ScrollController _scrollControllerRightContent = ScrollController();

  Targets _currentTarget = Targets.values.first;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 200,
          child: ListView.builder(
            controller: _scrollControllerLeftList,
            itemCount: Targets.values.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                // height: 100,
                child: ElevatedButton(
                  // style: ButtonStyle(
                  //   backgroundColor: WidgetStatePropertyAll(
                  //     _currentTarget == Targets.values[index] ? Colors.blue : Colors.amber,
                  //   ),
                  //   // textStyle: WidgetStateProperty,
                  //   // textStyle: Text(style: TextStyle(color:  _currentTarget == Targets.values[index] ? Colors.amber : Colors.grey,),),
                  // ),
                  style: ElevatedButton.styleFrom(
                    // minimumSize: Size(300, 100), // 버튼 최소 크기: 300,100 (버튼 안의 내용물 크기에 따라 변동 가능)
                    backgroundColor: _currentTarget == Targets.values[index] ? Colors.green : Colors.white, // 배경색: 파랑
                    foregroundColor: _currentTarget == Targets.values[index] ? Colors.white : Colors.black, // 글자색: 흰색
                    // textStyle: TextStyle(fontSize: 20) // 글자 size: 20
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
        const VerticalDivider(color: Colors.grey),
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
