import 'package:flutter/material.dart';

import 'my_checkbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Widget widget = MyCheckbox();
    return MaterialApp(
      title: widget.toString(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.toString()),
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          centerTitle: true,
        ),
        body: widget,
      ),
    );
  }
}
