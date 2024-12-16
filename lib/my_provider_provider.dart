import 'dart:math';

import 'package:flutter/material.dart';

class MyProviderProvider extends ChangeNotifier {
  factory MyProviderProvider() => _instance;
  MyProviderProvider._internal();
  static final MyProviderProvider _instance = MyProviderProvider._internal();

  String? text1;
  String? text2;
  String? text3;

  void change1({bool notify = true}) {
    text1 = _makeString(3);
    if (notify) {
      notifyListeners();
    }
  }

  String _makeString(int length) {
    const String xx = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List<String>.generate(length, (_) => xx[Random().nextInt(xx.length)]).join();
  }

  void change2() {
    text2 = _makeString(5);
    notifyListeners();
  }

  void change3() {
    text3 = _makeString(7);
    notifyListeners();
  }
}
