import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';

class MyFlutterLibrary extends StatefulWidget {
  const MyFlutterLibrary({super.key});

  @override
  State<MyFlutterLibrary> createState() => _MyFlutterLibraryState();
}

class _MyFlutterLibraryState extends State<MyFlutterLibrary> {
  int ww = 12093;
  num ww2 = 36334563425;
  String ww3 = '93458';
  // String ww3 = 'wqerwer';

  @override
  Widget build(BuildContext context) {
    final String aa = NumberFormat('###,###,###,###').format(ww);
    final String bb = NumberFormat('###,###,###,###').format(ww2);
    // final String cc = NumberFormat('###,###,###,###').format(ww3);
    return Column(
      children: <Widget>[
        Text(aa),
        const SizedBox(height: 10),
        Text(bb),
        const SizedBox(height: 10),
        // Text(cc),
        const SizedBox(height: 10),
      ],
    );
  }
}
